# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def register_vote_if_possible_for(resource, redirect_to:)
    resource.liked_by Teacher.first

    url = redirect_to
    message = if resource.vote_registered?
                { notice: 'Your vote has been successfully registered.' }
              else
                { alert: "You already voted for that #{resource.class.name.downcase}." }
              end

    redirect_to url, message
  end
end
