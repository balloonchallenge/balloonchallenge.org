$ ->
  $('select#team_country_code').change (event) ->
    select_wrapper = $('#team_state_code_wrapper')

    $('select', select_wrapper).attr('disabled', true)

    country_code = $(this).val()

    url = "/teams/subregion_options?parent_region=#{country_code}"
    select_wrapper.load(url)
