atom_feed :language => 'en-US' do |feed|
  feed.title @title
  feed.updated @updated

  @teams.each do |team|
    next if team.updated_at.blank?

    feed.entry( team ) do |entry|
      entry.url team_url(team)
      entry.name team.name
      entry.location team.location
      entry.school team.school
      entry.content team.description

      # the strftime is needed to work with Google Reader.
      entry.updated(team.updated_at.strftime("%Y-%m-%dT%H:%M:%SZ")) 
    end
  end
end