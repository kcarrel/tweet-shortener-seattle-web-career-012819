require "pry"

def dictionary
  dictionary = { 
  "hello" => "hi", "to" => "2", "two" => "2", "too" => "2", "for" => "4", "four" => "4", "be" => "b", "you" => "u", "at" => "@", "and" => "&"
  }
end

def word_substituter(tweet)
  replace = dictionary
  words = tweet.split(" ")
  words.collect do |word|
    dictionary.collect do |k,v|
      if word.downcase == k 
        word.replace(v)
      end
    end
  end
  words.join(" ")
end 

def bulk_tweet_shortener(tweets)
  tweets.collect do |tweet|
    tweet = word_substituter(tweet)
    puts tweet
  end
end

def selective_tweet_shortener(tweet)
  if tweet.length > 140
    word_substituter(tweet)
  else
    tweet
  end
end

def shortened_tweet_truncator(tweet)
  tweet = selective_tweet_shortener(tweet)
  if tweet.length > 140
    tweet[0...137] << ("...")
  else
    tweet
  end
end
