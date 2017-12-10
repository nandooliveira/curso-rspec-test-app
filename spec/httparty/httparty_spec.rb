describe 'HTTParty' do

  # before do
  #   stub_request(:get, "https://jsonplaceholder.typicode.com/posts/2").
  #     with(:headers => { 'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby' }).
  #     to_return(:status => 200, :body => "", :headers => { 'content-type': 'application/json' })
  # end

  it 'content-type', :vcr do
  # it 'content-type', vcr: { cassete_name: 'json_placeholder/post' } do
    # VCR.use_cassette('jsonplaceholder/post') do
      response = HTTParty.get('https://jsonplaceholder.typicode.com/posts/2')
      content_type = response.headers['content-type']
      expect(content_type).to match(/application\/json/)
    # end
  end

  it 'content-type2', vcr: { cassete_name: 'json_placeholder/post', match_requests_on: [:body] } do
    response = HTTParty.get('https://jsonplaceholder.typicode.com/posts/3')
    content_type = response.headers['content-type']
    expect(content_type).to match(/application\/json/)
  end
end