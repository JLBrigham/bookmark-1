feature 'viewing bookmarks' do
  scenario 'viewing bookmarks from the homepage' do
    connection = PG.connect(dbname: 'bookmark_manager_test')
    Bookmark.create(url: "http://www.makersacademy.com", title: "Makers")
    Bookmark.create(url: "http://www.destroyallsoftware.com", title: "Destroy All Software")
    Bookmark.create(url: "http://www.google.com", title: "Google")
    visit '/'
    click_link 'View Bookmarks'
    expect(page).to have_link("Google", href: "http://www.google.com")
    expect(page).to have_link("Makers", href: "http://www.makersacademy.com")
    expect(page).to have_link("Destroy All Software", href: "http://www.destroyallsoftware.com")
  end
end
