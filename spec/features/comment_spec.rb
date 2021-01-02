require 'rails_helper'

describe 'create comment' do
  it 'can comment on a post' do
    post = Post.create(title: 'Cool Post', body: 'Whoa yeah!')
    expect(Post.count).to eq(1)
    expect(Comment.count).to eq(0)
    expect(post.comments.count).to eq(0)

    visit post_path(post)

    fill_in 'comment[text]', with: 'Super cool'
    click_on 'Create Comment'

    expect(Comment.count).to eq(1)
    comment = Comment.first
    expect(post.comments).to eq([comment])
    expect(comment.post).to eq(post)
    expect(current_path).to eq(post_path(post))
    expect(page).to have_content('Super cool')
  end
end
