require 'rails_helper'

describe 'create post' do
  it 'can create a post' do
    visit new_post_path

    expect(current_path).to eq(new_post_path)
    expect(Post.count).to eq(0)

    fill_in 'post[title]', with: 'Cool Post'
    fill_in 'post[body]', with: 'Whoa yeah!'

    click_on 'Create Post'

    expect(Post.count).to eq(1)
    post = Post.first
    expect(current_path).to eq(post_path(post))

    expect(page).to have_content('Cool Post')
    expect(page).to have_content('Whoa yeah!')
  end
end
