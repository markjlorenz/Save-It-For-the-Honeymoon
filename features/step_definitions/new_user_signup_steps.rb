Given /^I have at least one deal$/ do
  Deal.create copy:'Example Deal Copy', copy_header:'Example Deal Header', copy_subheader:'Example Deal Subheader' if Deal.all.size == 0
end
