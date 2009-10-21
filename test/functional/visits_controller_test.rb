require 'test/test_helper'

class VisitsControllerTest < ActionController::TestCase
  context "on standard POST to visit with token and landing page" do
    setup do
      @website = Factory.create(:website)
      post :create, {:lp => Random.alphanumeric, :v16_id => @website.token}
    end

    should_assign_to :v
    should_not_assign_to :errors

    should "also set a session variable" do
      assert session["website_#{@website.token}"]
    end
  end

  context "on standard POST to visit without token" do
    setup do
      website = Factory.create(:website)
      post :create, {:lp => Random.alphanumeric}
    end

    should_assign_to :errors
    should_not_assign_to :v
  end

  context "on standard POST to visit with token without landing page" do
    setup do
      website = Factory.create(:website)
      post :create, {:v16_id => website.token}
    end

    should "have errors during create" do
      actual = assigns(:v)
      assert !actual.errors.nil?
    end

    should_not_assign_to :errors
  end

  context "on XML POST to visit with token and landing page" do
    setup do
      website = Factory.create(:website)
      @request.env["HTTP_ACCEPT"] = "text/xml"
      post :create, {:lp => Random.alphanumeric, :v16_id => website.token}, {'Content-Type'=>'text/xml'}
    end

    should "respond successfully" do
      assert_response :success
      actual = assigns(:v)
      assert_select 'visit' do
        assert_select 'id', actual.id.to_s
      end
    end
  end

  context "on XML POST to visit without v16 id" do
    setup do
      website = Factory.create(:website)
      @request.env["HTTP_ACCEPT"] = "text/xml"
      post :create, {:lp => Random.alphanumeric}, {'Content-Type'=>'text/xml'}
    end

    should "return an error" do
      assert_response :success
      assert_select 'errors' do
        assert_select 'error', "Vector16 ID missing.  Specify as 'v16_id' or 'tkn'"
      end
    end
  end

  context "on XML POST to visit with v16 id for non-existant site  " do
    setup do
      website = Factory.create(:website)
      @request.env["HTTP_ACCEPT"] = "text/xml"
      post :create, {:lp => Random.alphanumeric, :v16_id => Random.alphanumeric}, {'Content-Type'=>'text/xml'}
    end

    should "return an error" do
      assert_response :success
      assert_select 'errors' do
        assert_select 'error', /Specified Website Not Found/
      end
    end
  end

  context "after a visit has already been recorded" do
    setup do
      @website = Factory.create(:website)
      post :create, {:lp => Random.alphanumeric, :v16_id => @website.token}
    end


    context "return a visit record that if sent again as a PUT request with all the information required" do
      setup do
        @visit = assigns(:v)
        put :update, {:id => @visit.id, :sp => "second_page.htm", :v16_id => @website.token}
      end

      should "return a valid visitor record" do
        assert assigns(:v)
        assert assigns(:errors).blank?
      end

      should "also set a session variable" do
        assert session["visit_second_#{@visit.id}"]
      end
    end

    context "return a visit record that if sent again as a PUT request without a valid visitor id" do
      setup do
        put :update, {:id => 123, :sp => "second_page.htm", :v16_id => @website.token}
      end

      should_assign_to (:errors) {['Visit could not be found']}
    end

    context "return a visit record that if sent again without a v16_id" do
      setup do
        @visit = assigns(:v)
        put :update, {:id => @visit.id, :sp => "second_page.htm"}
      end

      should "return two errors" do
        errors = assigns(:errors)
        assert_equal errors.size, 2
        assert errors.detect {|x| x =~ /Visit/}
        assert errors.detect {|x| x =~ /Vector16 ID missing/}
      end
    end
  end
  
  context "on JS GET to new" do
    setup do
      @request.env["HTTP_ACCEPT"] = "text/javascript"
      get :new
    end

    should_respond_with_content_type(:js)
  end

  context "on JS POST to new" do
    setup do
      @request.env["HTTP_ACCEPT"] = "text/javascript"
      post :create
    end

    should_respond_with_content_type(:gif)
  end



end
