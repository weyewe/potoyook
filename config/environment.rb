# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Potoyook::Application.initialize!

ROLE = {
  :uploader => "Uploader",
  :voter => "Voter" , 
  :submission_filter => "SubmissionFilter",
  :judge => "Judge",
  :project_creator => "ProjectCreator"
}

TRUE_CHECK = 1
FALSE_CHECK = 0


FROM_DASHBOARD = 1 
NOT_FROM_DASHBOARD = 0 