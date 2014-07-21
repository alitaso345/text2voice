require "text2voice/version"
require 'uri'
require 'net/https'

class Text2voice
  class BadRequest < StandardError; end
  class Unauthoeized < StandardError; end

  ENDPOINT = URI('https://api.voicetext.jp/v1/tts')
  SPEAKERS = %w(show, haruka, hikari, takeru)
  EMOTIONS = %w(happiness, anger, sadness)
  EMOTION_LEVWL = {HIGHT: "2", ROW: "1"}

  def initialize(api_key)
    @api_key = api_key
    @speaker = "show"
    @pitch = "100"
    @speed = "100"
    @volume = "100"
  end

  def speaker(speaker_name)
    @speaker = speaker_name
    self
  end

  def emotion(emotion: nil, level: nil)
    @emotion = emotion
    @emotion_level = level
    self
  end

  def pitch(param)
    @pitch = param.to_s
    self
  end

  def speed(param)
    @speed = param.to_s
    self
  end

  def volulme(param)
    @volume = param.to_s
    self
  end

  def speak(text)
    @text = text
    self
  end

  def save
    res = send_request()
    
    case res
    when Net::HTTPOK
      res.body
    when Net::HTTPBadRequest
      raise BadRequest.new(res.body)
    when Net::HTTPUnauthorized
      raise Unauthoeized.new(res.body)
    else
      raise StandardError.new(res.body)
    end
  end

  def play
    res = send_request()
  end

  private
  def create_request(text, speaker, emotion, emotion_level, pitch, speed, volume)
    req = Net::HTTP::Post.new(ENDPOINT.path)
    req.basic_auth(@api_key, '')   
    data = "text=#{text}" 
    data << ";speaker=#{speaker}"
    data << ";emotion=#{emotion}"
    data << ";emotion_level=#{emotion_level}"
    data << ";pitch=#{pitch}"
    data << ";speed=#{speed}"
    data << ";volume=#{volume}"
    req.body = data
    
    return req
  end

  def send_request
    res = nil
    https = Net::HTTP.new(ENDPOINT.host, 443)
    https.use_ssl = true
    https.start do |https|
      req = create_request(@text, @speaker, @emotion, @emotion_level, @pitch, @speed, @volume)
      res = https.request(req)
    end

    return res
  end
end
