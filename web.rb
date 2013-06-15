require 'sinatra'

get '/stream' do
  puts "Streaming conneciton made"
  stream do |out|
    while true do
      File.read('lorum_ipsum').lines.each do |t|
        out << t
      end
    end
  end
end
