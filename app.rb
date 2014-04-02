require "sinatra"

get "/" do
  send_file File.join(settings.public_folder, 'index.html')
end

genius = Genius.new

get "/guess/:number" do
  content_type :json
  catch (:done) do 
    genius.guess(params[:number])
    { :key1 => 'value1', :key2 => 'value2' }.to_json
  end
end

get "/newGame" do
  genius = Genius.new
end
