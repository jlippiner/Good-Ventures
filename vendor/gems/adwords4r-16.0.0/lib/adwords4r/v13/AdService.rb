require 'xsd/qname'

module AdWords; module V13; module AdService


# Ad
# abstract
# - adGroupId - SOAP::SOAPLong
# - adType - AdWords::V13::AdService::AdType
# - destinationUrl - SOAP::SOAPString
# - disapproved - SOAP::SOAPBoolean
# - displayUrl - SOAP::SOAPString
# - exemptionRequest - SOAP::SOAPString
# - id - SOAP::SOAPLong
# - status - AdWords::V13::AdService::AdStatus
class Ad
  attr_accessor :adGroupId
  attr_accessor :adType
  attr_accessor :destinationUrl
  attr_accessor :disapproved
  attr_accessor :displayUrl
  attr_accessor :exemptionRequest
  attr_accessor :id
  attr_accessor :status

  def initialize(adGroupId = nil, adType = nil, destinationUrl = nil, disapproved = nil, displayUrl = nil, exemptionRequest = nil, id = nil, status = nil)
    @adGroupId = adGroupId
    @adType = adType
    @destinationUrl = destinationUrl
    @disapproved = disapproved
    @displayUrl = displayUrl
    @exemptionRequest = exemptionRequest
    @id = id
    @status = status
  end
end

# CommerceAd
# - adGroupId - SOAP::SOAPLong
# - adType - AdWords::V13::AdService::AdType
# - destinationUrl - SOAP::SOAPString
# - disapproved - SOAP::SOAPBoolean
# - displayUrl - SOAP::SOAPString
# - exemptionRequest - SOAP::SOAPString
# - id - SOAP::SOAPLong
# - status - AdWords::V13::AdService::AdStatus
# - description1 - SOAP::SOAPString
# - description2 - SOAP::SOAPString
# - headline - SOAP::SOAPString
# - postPriceAnnotation - SOAP::SOAPString
# - prePriceAnnotation - SOAP::SOAPString
# - priceString - SOAP::SOAPString
# - productImage - AdWords::V13::AdService::Image
class CommerceAd < Ad
  attr_accessor :adGroupId
  attr_accessor :adType
  attr_accessor :destinationUrl
  attr_accessor :disapproved
  attr_accessor :displayUrl
  attr_accessor :exemptionRequest
  attr_accessor :id
  attr_accessor :status
  attr_accessor :description1
  attr_accessor :description2
  attr_accessor :headline
  attr_accessor :postPriceAnnotation
  attr_accessor :prePriceAnnotation
  attr_accessor :priceString
  attr_accessor :productImage

  def initialize(adGroupId = nil, adType = nil, destinationUrl = nil, disapproved = nil, displayUrl = nil, exemptionRequest = nil, id = nil, status = nil, description1 = nil, description2 = nil, headline = nil, postPriceAnnotation = nil, prePriceAnnotation = nil, priceString = nil, productImage = nil)
    @adGroupId = adGroupId
    @adType = adType
    @destinationUrl = destinationUrl
    @disapproved = disapproved
    @displayUrl = displayUrl
    @exemptionRequest = exemptionRequest
    @id = id
    @status = status
    @description1 = description1
    @description2 = description2
    @headline = headline
    @postPriceAnnotation = postPriceAnnotation
    @prePriceAnnotation = prePriceAnnotation
    @priceString = priceString
    @productImage = productImage
  end
end

# ImageAd
# - adGroupId - SOAP::SOAPLong
# - adType - AdWords::V13::AdService::AdType
# - destinationUrl - SOAP::SOAPString
# - disapproved - SOAP::SOAPBoolean
# - displayUrl - SOAP::SOAPString
# - exemptionRequest - SOAP::SOAPString
# - id - SOAP::SOAPLong
# - status - AdWords::V13::AdService::AdStatus
# - image - AdWords::V13::AdService::Image
class ImageAd < Ad
  attr_accessor :adGroupId
  attr_accessor :adType
  attr_accessor :destinationUrl
  attr_accessor :disapproved
  attr_accessor :displayUrl
  attr_accessor :exemptionRequest
  attr_accessor :id
  attr_accessor :status
  attr_accessor :image

  def initialize(adGroupId = nil, adType = nil, destinationUrl = nil, disapproved = nil, displayUrl = nil, exemptionRequest = nil, id = nil, status = nil, image = nil)
    @adGroupId = adGroupId
    @adType = adType
    @destinationUrl = destinationUrl
    @disapproved = disapproved
    @displayUrl = displayUrl
    @exemptionRequest = exemptionRequest
    @id = id
    @status = status
    @image = image
  end
end

# LocalBusinessAd
# - adGroupId - SOAP::SOAPLong
# - adType - AdWords::V13::AdService::AdType
# - destinationUrl - SOAP::SOAPString
# - disapproved - SOAP::SOAPBoolean
# - displayUrl - SOAP::SOAPString
# - exemptionRequest - SOAP::SOAPString
# - id - SOAP::SOAPLong
# - status - AdWords::V13::AdService::AdStatus
# - address - SOAP::SOAPString
# - businessImage - AdWords::V13::AdService::Image
# - businessKey - SOAP::SOAPString
# - businessName - SOAP::SOAPString
# - city - SOAP::SOAPString
# - countryCode - SOAP::SOAPString
# - customIcon - AdWords::V13::AdService::Image
# - customIconId - SOAP::SOAPLong
# - description1 - SOAP::SOAPString
# - description2 - SOAP::SOAPString
# - fullBusinessName - SOAP::SOAPString
# - latitude - SOAP::SOAPInt
# - longitude - SOAP::SOAPInt
# - phoneNumber - SOAP::SOAPString
# - postalCode - SOAP::SOAPString
# - region - SOAP::SOAPString
# - stockIcon - AdWords::V13::AdService::StockIcon
# - targetRadiusInKm - SOAP::SOAPDouble
class LocalBusinessAd < Ad
  attr_accessor :adGroupId
  attr_accessor :adType
  attr_accessor :destinationUrl
  attr_accessor :disapproved
  attr_accessor :displayUrl
  attr_accessor :exemptionRequest
  attr_accessor :id
  attr_accessor :status
  attr_accessor :address
  attr_accessor :businessImage
  attr_accessor :businessKey
  attr_accessor :businessName
  attr_accessor :city
  attr_accessor :countryCode
  attr_accessor :customIcon
  attr_accessor :customIconId
  attr_accessor :description1
  attr_accessor :description2
  attr_accessor :fullBusinessName
  attr_accessor :latitude
  attr_accessor :longitude
  attr_accessor :phoneNumber
  attr_accessor :postalCode
  attr_accessor :region
  attr_accessor :stockIcon
  attr_accessor :targetRadiusInKm

  def initialize(adGroupId = nil, adType = nil, destinationUrl = nil, disapproved = nil, displayUrl = nil, exemptionRequest = nil, id = nil, status = nil, address = nil, businessImage = nil, businessKey = nil, businessName = nil, city = nil, countryCode = nil, customIcon = nil, customIconId = nil, description1 = nil, description2 = nil, fullBusinessName = nil, latitude = nil, longitude = nil, phoneNumber = nil, postalCode = nil, region = nil, stockIcon = nil, targetRadiusInKm = nil)
    @adGroupId = adGroupId
    @adType = adType
    @destinationUrl = destinationUrl
    @disapproved = disapproved
    @displayUrl = displayUrl
    @exemptionRequest = exemptionRequest
    @id = id
    @status = status
    @address = address
    @businessImage = businessImage
    @businessKey = businessKey
    @businessName = businessName
    @city = city
    @countryCode = countryCode
    @customIcon = customIcon
    @customIconId = customIconId
    @description1 = description1
    @description2 = description2
    @fullBusinessName = fullBusinessName
    @latitude = latitude
    @longitude = longitude
    @phoneNumber = phoneNumber
    @postalCode = postalCode
    @region = region
    @stockIcon = stockIcon
    @targetRadiusInKm = targetRadiusInKm
  end
end

# MobileAd
# - adGroupId - SOAP::SOAPLong
# - adType - AdWords::V13::AdService::AdType
# - destinationUrl - SOAP::SOAPString
# - disapproved - SOAP::SOAPBoolean
# - displayUrl - SOAP::SOAPString
# - exemptionRequest - SOAP::SOAPString
# - id - SOAP::SOAPLong
# - status - AdWords::V13::AdService::AdStatus
# - businessName - SOAP::SOAPString
# - countryCode - SOAP::SOAPString
# - description - SOAP::SOAPString
# - headline - SOAP::SOAPString
# - markupLanguages - SOAP::SOAPString
# - mobileCarriers - SOAP::SOAPString
# - phoneNumber - SOAP::SOAPString
class MobileAd < Ad
  attr_accessor :adGroupId
  attr_accessor :adType
  attr_accessor :destinationUrl
  attr_accessor :disapproved
  attr_accessor :displayUrl
  attr_accessor :exemptionRequest
  attr_accessor :id
  attr_accessor :status
  attr_accessor :businessName
  attr_accessor :countryCode
  attr_accessor :description
  attr_accessor :headline
  attr_accessor :markupLanguages
  attr_accessor :mobileCarriers
  attr_accessor :phoneNumber

  def initialize(adGroupId = nil, adType = nil, destinationUrl = nil, disapproved = nil, displayUrl = nil, exemptionRequest = nil, id = nil, status = nil, businessName = nil, countryCode = nil, description = nil, headline = nil, markupLanguages = [], mobileCarriers = [], phoneNumber = nil)
    @adGroupId = adGroupId
    @adType = adType
    @destinationUrl = destinationUrl
    @disapproved = disapproved
    @displayUrl = displayUrl
    @exemptionRequest = exemptionRequest
    @id = id
    @status = status
    @businessName = businessName
    @countryCode = countryCode
    @description = description
    @headline = headline
    @markupLanguages = markupLanguages
    @mobileCarriers = mobileCarriers
    @phoneNumber = phoneNumber
  end
end

# MobileImageAd
# - adGroupId - SOAP::SOAPLong
# - adType - AdWords::V13::AdService::AdType
# - destinationUrl - SOAP::SOAPString
# - disapproved - SOAP::SOAPBoolean
# - displayUrl - SOAP::SOAPString
# - exemptionRequest - SOAP::SOAPString
# - id - SOAP::SOAPLong
# - status - AdWords::V13::AdService::AdStatus
# - image - AdWords::V13::AdService::Image
# - markupLanguages - SOAP::SOAPString
# - mobileCarriers - SOAP::SOAPString
class MobileImageAd < Ad
  attr_accessor :adGroupId
  attr_accessor :adType
  attr_accessor :destinationUrl
  attr_accessor :disapproved
  attr_accessor :displayUrl
  attr_accessor :exemptionRequest
  attr_accessor :id
  attr_accessor :status
  attr_accessor :image
  attr_accessor :markupLanguages
  attr_accessor :mobileCarriers

  def initialize(adGroupId = nil, adType = nil, destinationUrl = nil, disapproved = nil, displayUrl = nil, exemptionRequest = nil, id = nil, status = nil, image = nil, markupLanguages = [], mobileCarriers = [])
    @adGroupId = adGroupId
    @adType = adType
    @destinationUrl = destinationUrl
    @disapproved = disapproved
    @displayUrl = displayUrl
    @exemptionRequest = exemptionRequest
    @id = id
    @status = status
    @image = image
    @markupLanguages = markupLanguages
    @mobileCarriers = mobileCarriers
  end
end

# TextAd
# - adGroupId - SOAP::SOAPLong
# - adType - AdWords::V13::AdService::AdType
# - destinationUrl - SOAP::SOAPString
# - disapproved - SOAP::SOAPBoolean
# - displayUrl - SOAP::SOAPString
# - exemptionRequest - SOAP::SOAPString
# - id - SOAP::SOAPLong
# - status - AdWords::V13::AdService::AdStatus
# - description1 - SOAP::SOAPString
# - description2 - SOAP::SOAPString
# - headline - SOAP::SOAPString
class TextAd < Ad
  attr_accessor :adGroupId
  attr_accessor :adType
  attr_accessor :destinationUrl
  attr_accessor :disapproved
  attr_accessor :displayUrl
  attr_accessor :exemptionRequest
  attr_accessor :id
  attr_accessor :status
  attr_accessor :description1
  attr_accessor :description2
  attr_accessor :headline

  def initialize(adGroupId = nil, adType = nil, destinationUrl = nil, disapproved = nil, displayUrl = nil, exemptionRequest = nil, id = nil, status = nil, description1 = nil, description2 = nil, headline = nil)
    @adGroupId = adGroupId
    @adType = adType
    @destinationUrl = destinationUrl
    @disapproved = disapproved
    @displayUrl = displayUrl
    @exemptionRequest = exemptionRequest
    @id = id
    @status = status
    @description1 = description1
    @description2 = description2
    @headline = headline
  end
end

# VideoAd
# - adGroupId - SOAP::SOAPLong
# - adType - AdWords::V13::AdService::AdType
# - destinationUrl - SOAP::SOAPString
# - disapproved - SOAP::SOAPBoolean
# - displayUrl - SOAP::SOAPString
# - exemptionRequest - SOAP::SOAPString
# - id - SOAP::SOAPLong
# - status - AdWords::V13::AdService::AdStatus
# - image - AdWords::V13::AdService::Image
# - name - SOAP::SOAPString
# - video - AdWords::V13::AdService::Video
class VideoAd < Ad
  attr_accessor :adGroupId
  attr_accessor :adType
  attr_accessor :destinationUrl
  attr_accessor :disapproved
  attr_accessor :displayUrl
  attr_accessor :exemptionRequest
  attr_accessor :id
  attr_accessor :status
  attr_accessor :image
  attr_accessor :name
  attr_accessor :video

  def initialize(adGroupId = nil, adType = nil, destinationUrl = nil, disapproved = nil, displayUrl = nil, exemptionRequest = nil, id = nil, status = nil, image = nil, name = nil, video = nil)
    @adGroupId = adGroupId
    @adType = adType
    @destinationUrl = destinationUrl
    @disapproved = disapproved
    @displayUrl = displayUrl
    @exemptionRequest = exemptionRequest
    @id = id
    @status = status
    @image = image
    @name = name
    @video = video
  end
end

# ApiError
# - code - SOAP::SOAPInt
# - detail - SOAP::SOAPString
# - field - SOAP::SOAPString
# - index - SOAP::SOAPInt
# - isExemptable - SOAP::SOAPBoolean
# - textIndex - SOAP::SOAPInt
# - textLength - SOAP::SOAPInt
# - trigger - SOAP::SOAPString
class ApiError
  attr_accessor :code
  attr_accessor :detail
  attr_accessor :field
  attr_accessor :index
  attr_accessor :isExemptable
  attr_accessor :textIndex
  attr_accessor :textLength
  attr_accessor :trigger

  def initialize(code = nil, detail = nil, field = nil, index = nil, isExemptable = nil, textIndex = nil, textLength = nil, trigger = nil)
    @code = code
    @detail = detail
    @field = field
    @index = index
    @isExemptable = isExemptable
    @textIndex = textIndex
    @textLength = textLength
    @trigger = trigger
  end
end

# ApiException
# - code - SOAP::SOAPInt
# - errors - AdWords::V13::AdService::ApiError
# - internal - SOAP::SOAPBoolean
# - message - SOAP::SOAPString
# - trigger - SOAP::SOAPString
class ApiException
  attr_accessor :code
  attr_accessor :errors
  attr_accessor :internal
  attr_accessor :message
  attr_accessor :trigger

  def initialize(code = nil, errors = [], internal = nil, message = nil, trigger = nil)
    @code = code
    @errors = errors
    @internal = internal
    @message = message
    @trigger = trigger
  end
end

# Business
# - address - SOAP::SOAPString
# - city - SOAP::SOAPString
# - countryCode - SOAP::SOAPString
# - key - SOAP::SOAPString
# - latitude - SOAP::SOAPString
# - longitude - SOAP::SOAPString
# - name - SOAP::SOAPString
# - phoneNumber - SOAP::SOAPString
# - postalCode - SOAP::SOAPString
# - region - SOAP::SOAPString
# - timestamp - SOAP::SOAPLong
class Business
  attr_accessor :address
  attr_accessor :city
  attr_accessor :countryCode
  attr_accessor :key
  attr_accessor :latitude
  attr_accessor :longitude
  attr_accessor :name
  attr_accessor :phoneNumber
  attr_accessor :postalCode
  attr_accessor :region
  attr_accessor :timestamp

  def initialize(address = nil, city = nil, countryCode = nil, key = nil, latitude = nil, longitude = nil, name = nil, phoneNumber = nil, postalCode = nil, region = nil, timestamp = nil)
    @address = address
    @city = city
    @countryCode = countryCode
    @key = key
    @latitude = latitude
    @longitude = longitude
    @name = name
    @phoneNumber = phoneNumber
    @postalCode = postalCode
    @region = region
    @timestamp = timestamp
  end
end

# Circle
# - latitudeMicroDegrees - SOAP::SOAPInt
# - longitudeMicroDegrees - SOAP::SOAPInt
# - radiusMeters - SOAP::SOAPInt
class Circle
  attr_accessor :latitudeMicroDegrees
  attr_accessor :longitudeMicroDegrees
  attr_accessor :radiusMeters

  def initialize(latitudeMicroDegrees = nil, longitudeMicroDegrees = nil, radiusMeters = nil)
    @latitudeMicroDegrees = latitudeMicroDegrees
    @longitudeMicroDegrees = longitudeMicroDegrees
    @radiusMeters = radiusMeters
  end
end

# CityTargets
# - cities - SOAP::SOAPString
# - excludedCities - SOAP::SOAPString
class CityTargets
  attr_accessor :cities
  attr_accessor :excludedCities

  def initialize(cities = [], excludedCities = [])
    @cities = cities
    @excludedCities = excludedCities
  end
end

# CountryTargets
# - countries - SOAP::SOAPString
# - excludedCountries - SOAP::SOAPString
class CountryTargets
  attr_accessor :countries
  attr_accessor :excludedCountries

  def initialize(countries = [], excludedCountries = [])
    @countries = countries
    @excludedCountries = excludedCountries
  end
end

# GeoTarget
# - cityTargets - AdWords::V13::AdService::CityTargets
# - countryTargets - AdWords::V13::AdService::CountryTargets
# - metroTargets - AdWords::V13::AdService::MetroTargets
# - proximityTargets - AdWords::V13::AdService::ProximityTargets
# - regionTargets - AdWords::V13::AdService::RegionTargets
# - targetAll - SOAP::SOAPBoolean
class GeoTarget
  attr_accessor :cityTargets
  attr_accessor :countryTargets
  attr_accessor :metroTargets
  attr_accessor :proximityTargets
  attr_accessor :regionTargets
  attr_accessor :targetAll

  def initialize(cityTargets = nil, countryTargets = nil, metroTargets = nil, proximityTargets = nil, regionTargets = nil, targetAll = nil)
    @cityTargets = cityTargets
    @countryTargets = countryTargets
    @metroTargets = metroTargets
    @proximityTargets = proximityTargets
    @regionTargets = regionTargets
    @targetAll = targetAll
  end
end

# Image
# - data - SOAP::SOAPBase64
# - height - SOAP::SOAPInt
# - imageUrl - SOAP::SOAPString
# - mimeType - SOAP::SOAPString
# - name - SOAP::SOAPString
# - shrunkenUrl - SOAP::SOAPString
# - thumbnailUrl - SOAP::SOAPString
# - type - AdWords::V13::AdService::ImageType
# - width - SOAP::SOAPInt
class Image
  attr_accessor :data
  attr_accessor :height
  attr_accessor :imageUrl
  attr_accessor :mimeType
  attr_accessor :name
  attr_accessor :shrunkenUrl
  attr_accessor :thumbnailUrl
  attr_accessor :type
  attr_accessor :width

  def initialize(data = nil, height = nil, imageUrl = nil, mimeType = nil, name = nil, shrunkenUrl = nil, thumbnailUrl = nil, type = nil, width = nil)
    @data = data
    @height = height
    @imageUrl = imageUrl
    @mimeType = mimeType
    @name = name
    @shrunkenUrl = shrunkenUrl
    @thumbnailUrl = thumbnailUrl
    @type = type
    @width = width
  end
end

# LanguageTarget
class LanguageTarget < ::Array
end

# MetroTargets
# - excludedMetros - SOAP::SOAPString
# - metros - SOAP::SOAPString
class MetroTargets
  attr_accessor :excludedMetros
  attr_accessor :metros

  def initialize(excludedMetros = [], metros = [])
    @excludedMetros = excludedMetros
    @metros = metros
  end
end

# ProximityTargets
class ProximityTargets < ::Array
end

# RegionTargets
# - excludedRegions - SOAP::SOAPString
# - regions - SOAP::SOAPString
class RegionTargets
  attr_accessor :excludedRegions
  attr_accessor :regions

  def initialize(excludedRegions = [], regions = [])
    @excludedRegions = excludedRegions
    @regions = regions
  end
end

# StatsRecord
# - averagePosition - SOAP::SOAPDouble
# - clicks - SOAP::SOAPLong
# - conversionRate - SOAP::SOAPDouble
# - conversions - SOAP::SOAPLong
# - cost - SOAP::SOAPLong
# - id - SOAP::SOAPLong
# - impressions - SOAP::SOAPLong
class StatsRecord
  attr_accessor :averagePosition
  attr_accessor :clicks
  attr_accessor :conversionRate
  attr_accessor :conversions
  attr_accessor :cost
  attr_accessor :id
  attr_accessor :impressions

  def initialize(averagePosition = nil, clicks = nil, conversionRate = nil, conversions = nil, cost = nil, id = nil, impressions = nil)
    @averagePosition = averagePosition
    @clicks = clicks
    @conversionRate = conversionRate
    @conversions = conversions
    @cost = cost
    @id = id
    @impressions = impressions
  end
end

# Video
# - duration - SOAP::SOAPLong
# - filename - SOAP::SOAPString
# - preview - SOAP::SOAPString
# - title - SOAP::SOAPString
# - videoId - SOAP::SOAPLong
class Video
  attr_accessor :duration
  attr_accessor :filename
  attr_accessor :preview
  attr_accessor :title
  attr_accessor :videoId

  def initialize(duration = nil, filename = nil, preview = nil, title = nil, videoId = nil)
    @duration = duration
    @filename = filename
    @preview = preview
    @title = title
    @videoId = videoId
  end
end

# AdStatus
class AdStatus < ::String
  Disabled = AdStatus.new("Disabled")
  Enabled = AdStatus.new("Enabled")
  Paused = AdStatus.new("Paused")
end

# AdType
class AdType < ::String
  CommerceAd = AdType.new("CommerceAd")
  ImageAd = AdType.new("ImageAd")
  LocalBusinessAd = AdType.new("LocalBusinessAd")
  MobileAd = AdType.new("MobileAd")
  MobileImageAd = AdType.new("MobileImageAd")
  TextAd = AdType.new("TextAd")
  VideoAd = AdType.new("VideoAd")
end

# ImageType
class ImageType < ::String
  DynamicImage = ImageType.new("dynamicImage")
  Flash = ImageType.new("flash")
  Image = ImageType.new("image")
end

# StockIcon
class StockIcon < ::String
  Standard_1 = StockIcon.new("Standard_1")
  Standard_10 = StockIcon.new("Standard_10")
  Standard_11 = StockIcon.new("Standard_11")
  Standard_12 = StockIcon.new("Standard_12")
  Standard_13 = StockIcon.new("Standard_13")
  Standard_14 = StockIcon.new("Standard_14")
  Standard_15 = StockIcon.new("Standard_15")
  Standard_16 = StockIcon.new("Standard_16")
  Standard_17 = StockIcon.new("Standard_17")
  Standard_2 = StockIcon.new("Standard_2")
  Standard_3 = StockIcon.new("Standard_3")
  Standard_4 = StockIcon.new("Standard_4")
  Standard_5 = StockIcon.new("Standard_5")
  Standard_6 = StockIcon.new("Standard_6")
  Standard_7 = StockIcon.new("Standard_7")
  Standard_8 = StockIcon.new("Standard_8")
  Standard_9 = StockIcon.new("Standard_9")
end

# addAds
class AddAds < ::Array #:nodoc: all
end

# addAdsResponse
class AddAdsResponse < ::Array #:nodoc: all
end

# checkAds
# - ads - AdWords::V13::AdService::Ad
# - languageTarget - AdWords::V13::AdService::LanguageTarget
# - geoTarget - AdWords::V13::AdService::GeoTarget
class CheckAds #:nodoc: all
  attr_accessor :ads
  attr_accessor :languageTarget
  attr_accessor :geoTarget

  def initialize(ads = [], languageTarget = nil, geoTarget = nil)
    @ads = ads
    @languageTarget = languageTarget
    @geoTarget = geoTarget
  end
end

# checkAdsResponse
class CheckAdsResponse < ::Array #:nodoc: all
end

# findBusinesses
# - name - SOAP::SOAPString
# - address - SOAP::SOAPString
# - countryCode - SOAP::SOAPString
class FindBusinesses #:nodoc: all
  attr_accessor :name
  attr_accessor :address
  attr_accessor :countryCode

  def initialize(name = nil, address = nil, countryCode = nil)
    @name = name
    @address = address
    @countryCode = countryCode
  end
end

# findBusinessesResponse
class FindBusinessesResponse < ::Array #:nodoc: all
end

# getActiveAds
class GetActiveAds < ::Array #:nodoc: all
end

# getActiveAdsResponse
class GetActiveAdsResponse < ::Array #:nodoc: all
end

# getAd
# - adGroupId - SOAP::SOAPLong
# - adId - SOAP::SOAPLong
class GetAd #:nodoc: all
  attr_accessor :adGroupId
  attr_accessor :adId

  def initialize(adGroupId = nil, adId = nil)
    @adGroupId = adGroupId
    @adId = adId
  end
end

# getAdResponse
# - getAdReturn - AdWords::V13::AdService::Ad
class GetAdResponse #:nodoc: all
  attr_accessor :getAdReturn

  def initialize(getAdReturn = nil)
    @getAdReturn = getAdReturn
  end
end

# getAdStats
# - adGroupId - SOAP::SOAPLong
# - adIds - SOAP::SOAPLong
# - startDay - SOAP::SOAPDate
# - endDay - SOAP::SOAPDate
class GetAdStats #:nodoc: all
  attr_accessor :adGroupId
  attr_accessor :adIds
  attr_accessor :startDay
  attr_accessor :endDay

  def initialize(adGroupId = nil, adIds = [], startDay = nil, endDay = nil)
    @adGroupId = adGroupId
    @adIds = adIds
    @startDay = startDay
    @endDay = endDay
  end
end

# getAdStatsResponse
class GetAdStatsResponse < ::Array #:nodoc: all
end

# getAllAds
class GetAllAds < ::Array #:nodoc: all
end

# getAllAdsResponse
class GetAllAdsResponse < ::Array #:nodoc: all
end

# getMyBusinesses
class GetMyBusinesses #:nodoc: all
  def initialize
  end
end

# getMyBusinessesResponse
class GetMyBusinessesResponse < ::Array #:nodoc: all
end

# getMyVideos
class GetMyVideos #:nodoc: all
  def initialize
  end
end

# getMyVideosResponse
class GetMyVideosResponse < ::Array #:nodoc: all
end

# updateAds
class UpdateAds < ::Array #:nodoc: all
end

# updateAdsResponse
class UpdateAdsResponse #:nodoc: all
  def initialize
  end
end


end; end; end
