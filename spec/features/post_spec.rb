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

describe 'post index' do
  it 'can show all posts' do
    post1 = Post.create(title: 'Cool Post', body: 'Whoa yeah!')
    post2 = Post.create(title: 'Super Post', body: 'Yow!!!')

    visit posts_path

    expect(page).to have_content('Cool Post')
    expect(page).to have_content('Super Post')

    click_on 'Cool Post'
    expect(current_path).to eq(post_path(post1))

    click_on 'Blogzilla'
    expect(current_path).to eq(posts_path)

    click_on 'Super Post'
    expect(current_path).to eq(post_path(post2))
  end
end

describe 'likes' do
  it 'can like a posts' do
    post = Post.create(title: 'Cool Post', body: 'Whoa yeah!')

    visit post_path(post)

    expect(page).to have_content('Likes: 0')
    expect(post.likes).to eq(0)

    click_on 'Like'

    expect(Post.first.likes).to eq(1)
  end
end
