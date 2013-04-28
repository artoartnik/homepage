require 'spec_helper'

describe "Posts" do

  before do
	@post = Post.create :title => 'New post', :content => 'Some text for the post.'
  end 
  
  describe "GET /posts" do
    it "displays some posts" do
    	visit posts_path
    	page.should have_content "New post"
    end

    it "creates a new post" do
    	visit new_post_path
    	
    	fill_in 'Title', :with => 'Newly created post'
    	fill_in 'Content', :with => 'New post content.'

    	click_button 'Create Post'

    	current_path.should == root_path
    	page.should have_content 'New post content.'
    end
  end

  describe "PUT /posts" do
  	it "edits a post" do
  		
  		visit posts_path
  		click_link 'Edit'

  		current_path.should == edit_post_path(@post)
  		page.should have_content 'Some text for the post.'
  		
  		fill_in 'Content', :with => 'Edited text of a post.'
  		click_button 'Update Post'

  		current_path.should == root_path
  		page.should have_content 'Edited text of a post.'

  	end

  	it "should not update with empty fields" do
  		visit posts_path
  		click_link 'Edit'

  		current_path.should == edit_post_path(@post)
  		page.should have_content 'Some text for the post.'
  		
  		fill_in 'Content', :with => ''
  		fill_in 'Title', :with => ''
  		click_button 'Update Post'

  		current_path.should == post_path(@post) #because we called 'render' instead of redirecting
  		page.should have_content 'There was an error updating the post.'
  	end
  end

  describe "DELETE /posts" do
  	it "deletes a post" do
  		visit posts_path

  		find("#post_#{@post.id}").click_link "Delete"
  		
  		page.should have_content 'The post has been deleted.'
  		page.should have_no_content 'Some text for the post.'

  	end
  end
end
