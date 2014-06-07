require "net/https"
require "uri"
class Page < ActiveRecord::Base
  validates :name, presence: true
  validates :uid, presence: true
  validates :json, presence: true

  before_validation :get_page

  def graph_url
    "https://graph.facebook.com/#{translated_url}"
  end

  def image_url
    "https://graph.facebook.com/#{translated_url}/picture"
  end

  def about; data(:about); end
  def description; data(:description); end

  private

  def data key
    JSON.parse(json)[key.to_s]
  end

  def translated_url
    URI.parse(url).path.gsub(/^\//, "")
  end

  def get_page
    uri = URI.parse(graph_url)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new(uri.request_uri)
    response = http.request(request)

    if response.code == "200"
      self.url = translated_url
      self.json = response.body
      self.name = data(:name)
      self.uid = data(:id)
      self.last_likes = data(:likes)
    end
  end
end
