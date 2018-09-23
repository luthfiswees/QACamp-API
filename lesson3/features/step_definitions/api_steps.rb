Given("I want to get todos with in {string}") do |url|
    @url = url
end

Given("I want to fetch todos data with id {string}") do |id|
    @resp = Faraday.get "#{@url}/#{id}"
    @content = JSON.parse(@resp.body)
end

Then("I should get todos with id {string}") do |id|
    expect(@content['id']).to eq id.to_i
end

Then("I should get todos with title {string}") do |title|
    expect(@content['title']).to eq title
end

Then("Show me the response") do
  puts @content
end

Then("Response status should be {string}") do |status|
  expect(@resp.status).to eq(status.to_i)
end
