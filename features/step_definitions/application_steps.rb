Then /^I should (not )?see an element "([^"]*)"$/ do |negate, selector|
  expectation = negate ? :should_not : :should
  page.send(expectation, have_css(selector, visible:true))
end

When /^I press the button with css "([^"]*)"$/ do |css|
  find(:css, css).click
end
