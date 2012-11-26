Feature: Merge Articles
  As a blog administrator
  In order combine similar content into one article
  I want to be able to merge an existing article to another existing article

  Background:
    Given the blog is set up

 Scenario: When articles are merged, the merged article should contain the text of both previous articles
   Given I am logged in as a publisher 
    And I am on the new article page
   When I fill in "article_title" with "Foobar-publisher"
    And I fill in "article__body_and_extended_editor" with "publisher content"
    And I press "Publish"
   Then I should be on the admin content page
   Given I am logged out
    And I am logged into the admin panel
    And I am on the new article page
   When I fill in "article_title" with "Foobar-administrator"
    And I fill in "article__body_and_extended_editor" with "administrator content"
    And I press "Publish"
   Then I should be on the admin content page
   Then I should see "Foobar-administrator"
    And I should see "Foobar-publisher"
   When I follow "Foobar-administrator"
     And I fill in the merge article id for "Foobar-publisher"
     And I press "Merge" 
   Then I should be on the admin content page 
     And I should see "Foobar-administrator"
     And I should not see "Foobar-publisher"

 Scenario: A non-admin cannot merge two articles

