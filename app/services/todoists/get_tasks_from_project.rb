module Todoists
  class GetTasksFromProject < ApplicationService
    def initialize(_attr = {})
      @project_id = ENV['TODOIST_TEST_CHANNEL']
      @token = ENV['DC_TODOIST_TOKEN']
      @endpoint = 'https://api.todoist.com/rest/v2/tasks?project_id='
      super()
    end

    def call
      url = @endpoint + @project_id.to_s

      headers = {
        "Content-Type": 'application/json',
        "Authorization": "Bearer #{@token}"
      }

      # GET request
      response = RestClient.get(url, headers)

      JSON.parse(response)
      ## Example response
      #   [{"id"=>"7036319947",
      #   "assigner_id"=>"15279043",
      #   "assignee_id"=>"15335539",
      #   "project_id"=>"2170202957",
      #   "section_id"=>nil,
      #   "parent_id"=>nil,
      #   "order"=>11,
      #   "content"=>"Measure and cut drawer matt",
      #   "description"=>"",
      #   "is_completed"=>false,
      #   "labels"=>[],
      #   "priority"=>1,
      #   "comment_count"=>0,
      #   "creator_id"=>"15279043",
      #   "created_at"=>"2023-07-10T11:29:22.510460Z",
      #   "due"=>nil,
      #   "url"=>"https://todoist.com/showTask?id=7036319947",
      #   "duration"=>nil},
      #   ...]
    end
  end
end
