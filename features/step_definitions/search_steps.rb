Given(/^We navigate to Google Images$/) do
  $d.navigate.to "http://images.google.com/"
end

When(/^We search for the word robot$/) do
  $d.find_element(:id, 'lst-ib').send_keys('robots')
  $d.find_element(:id, 'lst-ib').send_keys(:enter)
end

Then(/^Results will be displayed$/) do
  sleep 3
  begin
    expect($d.title).to include('robots')
    results = $d.find_element(:id, 'rg_s').find_elements(:tag_name, 'div')
    expect(results.length).to be > 0
  ensure
    $d.quit
  end
end
