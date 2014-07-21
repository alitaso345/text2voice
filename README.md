# Text2voice

This gem is Voice Text Web API(https://cloud.voicetext.jp/webapi/docs/introduction) for Ruby.

## Installation

Add this line to your application's Gemfile:

    gem 'text2voice'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install text2voice

## Usage

    require 'text2voice'

    voice = TextToVoice.new("Your API key")

    voice.speak("こころぴょんぴょん")
         .speaker("haruka")
         .emotion(emotion: :happiness, level: :HIGHT)

    voice.save_as("test.wav") 

## Contributing

1. Fork it ( http://github.com/<my-github-username>/text2voice/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
