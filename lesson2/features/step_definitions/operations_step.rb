Given("a number {string}") do |number_1|
    @result = number_1.to_i
end
  
Given("number {string}") do |number_2|
    @result = @result + number_2.to_i
end
  
Then("we should add them and have {string}") do |result|
    expect(@result).to eq result.to_i
end