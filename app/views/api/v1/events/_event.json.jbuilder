json.id event.id
json.name event.name
json.address event.address
json.owner do
  if event.owner_type == 'User'
    json.partial! 'api/v1/users/user', user: event.owner
  else
    json.partial! 'api/v1/establishments/establishment', establishment: event.owner
  end
end
json.owner_type event.owner_type
json.starting_hour event.starting_hour
json.ending_hour event.ending_hour
json.description event.description
json.categories event.categories do |category|
  json.partial! 'category', category: category
end
json.localities event.localities
json.starting_price event.starting_price
json.followers event.followers
json.attendants event.attendants
if event.cover.attached?
  if Rails.env.production?
    json.cover event.cover.service_url
  else
    json.cover Rails.application.routes.url_helpers.rails_blob_url(event.cover)
  end
end
json.main_category event.main_category
json.main_category_code Event.main_categories[event.main_category]
json.latitude event.latitude
json.longitude event.longitude
