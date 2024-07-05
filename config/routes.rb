Rails.application.routes.draw do
  get 'repositories/show'
  get 'repositories/branches'
  get 'commits/show'
  get 'commits/compare'
  get 'commits/index'
  get 'repos/:owner/:repo/commits/:commit_id', to: 'commits#show'
  get 'repos/:owner/:repo/compare/:base_commit...:head_commit', to: 'commits#compare'
  get 'repos/:owner/:repo/commits', to: 'commits#index'
  get 'repos/:owner/:repo', to: 'repositories#show'
  get 'repos/:owner/:repo/branches', to: 'repositories#branches'
end
