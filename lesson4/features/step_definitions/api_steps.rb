Given("I want to get user data from {string}") do |url|
    @url = "#{url}/users"
end
  
Given("I want to fetch user data with id {string}") do |id|
    @resp = Faraday.get "#{@url}/#{id}"
    @content = JSON.parse(@resp.body)
end

Then("I should have a response with status code {string}") do |string|
    expect(@resp.status).to eq 200
end
  
Then("I should get user data with id {string}") do |id|
    expect(@content['id']).to eq id.to_i
end
  
Then("I should get todos with name {string}") do |title|
    expect(@content['name']).to eq title
end

Then("I should get element in {string} to have value {string}") do |json_path, value|
    results = JsonPath.new(json_path).on(@content).to_a.map(&:to_s)[0]
    expect(results).to eq value
end