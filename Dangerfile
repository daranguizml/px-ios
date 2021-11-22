require 'json'
require 'git_diff_parser'

has_app_changes = github.pr_diff.include?("MercadoPagoSDK/MercadoPagoSDK/*")
has_test_changes = github.pr_diff.include?("MercadoPagoSDK/MercadoPagoSDKTests/*")

# Lint
swiftlint.strict = false
swiftlint.max_num_violations = 150
swiftlint.config_file = 'ExampleSwift/.swiftlint.yml'
swiftlint.binary_path = "ExampleSwift/Pods/SwiftLint/swiftlint"

diff = GitDiffParser::Patches.parse(github.pr_diff)
dir = "#{Dir.pwd}/"
swiftlint.lint_files(inline_mode: true) { |violation|
  diff_filename = violation['file'].gsub(dir, '')
  file_patch = diff.find_patch_by_file(diff_filename)
  file_patch != nil && file_patch.changed_lines.any? { |line| line.number == violation['line']}
}

 # Verify if PR title contains Jira task
tickets = github.pr_title.scan(/\[(\w{1,10}-\d+)\]/)
if tickets.empty?
  message('This PR does not include any JIRA tasks in the title. (e.g. [TICKET-1234])')
else
  ticket_urls = tickets.map do |ticket|
    "[#{ticket[0]}](https://mercadolibre.atlassian.net/browse/#{ticket[0]})"
  end
  message("JIRA: " + ticket_urls.join(" "))
end

# Check if PR has tests
if has_test_changes 
  warn "This PR does not include tests, review carefully"
end

# Leave warning, if Podfile changes
podfile_updated = !git.modified_files.grep(/Podfile/).empty?
if podfile_updated
  warn "The `Podfile` was updated"
end

# Leave warning, if a Podspec changes
podfile_updated = !git.modified_files.grep(/podspec/).empty?
if podfile_updated
  warn "A `podspec` was updated"
end

# Mainly to encourage writing up some reasoning about the PR, rather than just leaving a title
fail "Please, follow the PR template to better document your changes." if github.pr_body.length < 15

# Add a CHANGELOG entry for app changes
has_changelog_changes = git.modified_files.include?("CHANGELOG.md")
if has_app_changes && !has_changelog_changes
  fail("Please include a CHANGELOG entry. \nYou can find it at [CHANGELOG.md](https://github.com/mercadopago/px-ios/blob/develop/CHANGELOG.md).")
end

# Warn when there is a big PR
message "You and the size of your PR are awesome! 🚀" if git.lines_of_code < 500
warn "Big PR, consider splitting into smaller ones." if git.lines_of_code >= 500 && git.lines_of_code < 1000
fail "Big PR, consider splitting into smaller ones." if git.lines_of_code >= 1000