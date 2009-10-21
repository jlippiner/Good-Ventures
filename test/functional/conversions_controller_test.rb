require 'test/test_helper'

class ConversionsControllerTest < ActionController::TestCase
  context "on standard POST to visit with token and landing page" do
    setup do
      website = Factory.create(:website)
      @visit = Factory.create(:visit, {:website => website})
      post :create, {:visit => @visit.id, :v16_id => website.token, :value => Random.number(10)}
    end

    should_assign_to :c
    should_not_assign_to :errors

    should "also set a session variable" do
      assert session["visit_#{@visit.id}"]
    end
  end

  context "on standard POST to visit without token" do
    setup do
      visit = Factory.create(:visit)
      post :create, {:visit => visit.id, :value => Random.number(10)}
    end

    should_assign_to :errors
    should_not_assign_to :c
  end

  context "on standard POST to visit with token without visit_id" do
    setup do
      website = Factory.create(:website)
      post :create, {:v16_id => website.token, :value => Random.number(10)}
    end

    should_assign_to :errors
    should_not_assign_to :c
  end

  context "on XML POST to visit with token and landing page" do
    setup do
      @request.env["HTTP_ACCEPT"] = "text/xml"
      website = Factory.create(:website)
      visit = Factory.create(:visit, {:website => website})
      post :create, {:visit => visit.id, :v16_id => website.token, :value => Random.number(10)}
    end

    should_respond_with_content_type(:xml)

    should "respond successfully" do
      assert_response :success
      actual = assigns(:c)
      assert_select 'conversion' do
        assert_select 'id', actual.id.to_s
      end
    end
  end

  context "on XML POST to visit without v16 id" do
    setup do
      @request.env["HTTP_ACCEPT"] = "text/xml"
      visit = Factory.create(:visit)
      post :create, {:visit => visit.id, :value => Random.number(10)}
    end

    should_respond_with_content_type(:xml)

    should "return an error" do
      assert_response :success
      assert_select 'errors' do
        assert_select 'error', "Vector16 ID missing.  Specify as 'v16_id' or 'tkn'"
      end
    end
  end

  context "on XML POST to visit with v16 id for non-existant site  " do
    setup do
      @request.env["HTTP_ACCEPT"] = "text/xml"
      visit = Factory.create(:visit)
      post :create, {:visit => visit.id, :v16_id => "xxxx", :value => Random.number(10)}
    end

    should "return an error" do
      assert_response :success
      assert_select 'errors' do
        assert_select 'error', /Visit not recorded/
      end
    end
  end

  context "on JS GET to new" do
    setup do
      @request.env["HTTP_ACCEPT"] = "text/javascript"
      website = Factory.create(:website)
      visit = Factory.create(:visit, {:website => website})
      get :new, {:visit => visit.id, :v16_id => website.token, :value => Random.number(10)}
    end

    should_respond_with_content_type(:js)
  end

  context "on JS POST to new" do
    setup do
      @request.env["HTTP_ACCEPT"] = "text/javascript"
      website = Factory.create(:website)
      visit = Factory.create(:visit, {:website => website})
      post :create, {:visit => visit.id, :v16_id => website.token, :value => Random.number(10)}
    end

    should_respond_with_content_type(:gif)
  end


end
