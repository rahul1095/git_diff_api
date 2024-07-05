class RepositoriesController < ApplicationController
  include GithubApiHelper

  def show
    @repo = fetch_repository(params[:owner], params[:repo])
    render json: @repo
  end

  def branches
    @branches = fetch_branches(params[:owner], params[:repo])
    render json: @branches
  end
end
