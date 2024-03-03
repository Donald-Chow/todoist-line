module Todoists
  class GetTasksFromProject < ApplicationService
    def initialize(_attr = {})
      @project_id = ENV['TODOIST_TEST_CHANNEL']
      @token = ENV['DC_TODOIST_TOKEN']

      @headers = {
        "Content-Type": 'application/json',
        "Authorization": "Bearer #{@token}"
      }
      super()
    end

    def call
      collaborators = fetch_collaborators
      tasks = fetch_tasks
      tasks.each do |task|
        # task['assignee_id'] = collaborators.find { |collaborator| collaborator['id'] == task['assignee_id'] }['name'] if task['assignee_id']
        if task['assignee_id']
          task['assignee_id'] = collaborators.find { |collaborator| collaborator['id'] == task['assignee_id'] }['name']
        end
      end
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

    private

    def fetch_collaborators
      url = "https://api.todoist.com/rest/v2/projects/#{@project_id}/collaborators"

      response = RestClient.get(url, @headers)
      JSON.parse(response)
    end

    def fetch_tasks
      url = "https://api.todoist.com/rest/v2/tasks?project_id=#{@project_id}"
      # GET request
      response = RestClient.get(url, @headers)
      JSON.parse(response)
    end
  end
end
