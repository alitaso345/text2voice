require "text2voice/version"
require 'uri'
require 'net/https'

module Text2voice
  class BadRequest < StandardError; end
  class Unauthoeized < StandardError; end

  ENDPOINT = URI('https://api.voicetext.jp/v1/tts')
  SPEAKERS = %w(show, haruka, hikari, takeru)
  EMOTIONS = %w(happiness, anger, sadness)
  EMOTION_LEVWL = {HIGHT: "2", ROW: "1"}

  def initialize(api_key)
    @api_key = api_key
    @speaker = "show"
    @pitch = 100.to_s
    @volume = 100.to_s
  end

  def speaker(speaker_name)
    @speaker = speaker_name
  end

  def emotion(emotion: nil, level: nil)
    @emotion = emotion
    @emotion_level = level
  end

  def pitch(param)
    @pitch = param.to_s
  end

  def volulme(param)
    @volume = param.to_s
  end

  def speak(text)
    @text = text
  end

  def save(wav)

  end

  def play(wav)

  end

  def create_request(text, speaker, emotion, emotion_level, pitch, speed, volume)

  end
end
