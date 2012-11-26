When /^I fill in the merge article id for "(.*?)"$/ do |article_name|
#  pending # express the regexp above with the code you wish you had
   article_id = Article.find_by_title(article_name).id

   step "I fill in \"merge_with\" with \"#{article_id}\""
end

