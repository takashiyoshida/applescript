$library_dir = File.join(Dir.home, "Library")
$scripts_dir = File.join($library_dir, "Scripts")
$applications_dir = File.join($scripts_dir, "Applications")
$dir_mask = 0700

task :default => [:install]

task :make_scripts_dir do
  unless File.directory? $scripts_dir
    Dir.mkdir($scripts_dir, $dir_mask)
    system("chmod +a \"everyone deny delete\" #{$scripts_dir}")

    unless File.directory? $applications_dir
      Dir.mkdir($applications_dir, $dir_mask)
    end
  end
end

task :make_subdirectory, [:dest_dir, :dir_names] => [:make_scripts_dir] do | t, args |
  dest_dir = args[:dest_dir]
  dir_names = args[:dir_names]

  dir_names.each do | dir_name |
    destination = File.join("#{dest_dir}", "#{dir_name}")
    unless File.directory? destination
      Dir.mkdir(destination, $dir_mask)
    end
  end
end

desc "Make directories for scripts"
task :make_application_dirs do
  dir_names = Array.new
  dir_names.push("Safari")
  dir_names.push("Finder")
  Rake::Task["make_subdirectory"].invoke($applications_dir, dir_names)

  dir_names = Array.new
  dir_names.push("Folder Action Scripts")
  Rake::Task["make_subdirectory"].reenable
  Rake::Task["make_subdirectory"].invoke($scripts_dir, dir_names)
end

task :compile, :src, :out do |t, args|
  src = args[:src]
  out = args[:out]
  puts "osacompile -o \"#{out}\" \"#{src}\""
  system("osacompile -o \"#{out}\" \"#{src}\"")
end

desc "Installs all scripts"
task :install do
  Rake::Task["switch_to_quiet_mode"].invoke
  Rake::Task["switch_to_normal_mode"].invoke
  Rake::Task["save_safari_window_positions"].invoke
  Rake::Task["open_home_folders"].invoke
  Rake::Task["close_all_finder_windows"].invoke
end

desc "Installs 'Switch to Quiet Mode' script"
task :switch_to_quiet_mode => :make_application_dirs do
  src = "switch_to_quiet_mode.applescript"
  out = "Switch to Quiet Mode.scpt"
  Rake::Task["compile"].execute(:src => src, :out => out)
  FileUtils.mv(out, $scripts_dir)
end

desc "Installs 'Switch to Normal Mode' script"
task :switch_to_normal_mode => :make_application_dirs do
    src = "switch_to_normal_mode.applescript"
    out = "Switch to Normal Mode.scpt"
    Rake::Task["compile"].execute(:src => src, :out => out)
    FileUtils.mv(out, $scripts_dir)
end

desc "Installs 'Open in Google Chrome' script"
task :open_in_google_chrome => :make_application_dirs do
  src = "open_in_google_chrome.applescript"
  out = "Open in Google Chrome.scpt"
  Rake::Task["compile"].execute(:src => src, :out => out)

  destination = File.join($applications_dir, "Safari")
  FileUtils.mv(out, destination)
end

desc "Installs 'Save Safari Window Positions' script"
task :save_safari_window_positions => :make_application_dirs do
  src = "save-safari-window-pos.applescript"
  out = "Save Safari Window Positions.scpt"
  Rake::Task["compile"].execute(:src => src, :out =>out)

  destination = File.join($applications_dir, "Safari")
  FileUtils.mv(out, destination)
end

desc "Installs 'Create Weekly PPP email' script"
task :create_weekly_ppp_email => :make_application_dirs do
  src = "create_weekly_ppp.applescript"
  out = "Create Weekly PPP Email.scpt"
  Rake::Task["compile"].execute(:src => src, :out => out)

  destination = File.join($applications_dir, "Airmail 3")
  FileUtils.mv(out, destination)
end

desc "Installs 'Open Home Folders' script"
task :open_home_folders => :make_application_dirs do
  src = "open_home_folders.applescript"
  out = "Open Home Folders.scpt"
  Rake::Task["compile"].execute(:src => src, :out => out)

  destination = File.join($applications_dir, "Finder")
  FileUtils.mv(out, destination)
end

desc "Installs 'Close All Finder Windows' script"
task :close_all_finder_windows => :make_application_dirs do
  src = "close_all_finder_windows.applescript"
  out = "Close All Finder Windows.scpt"
  Rake::Task["compile"].execute(:src => src, :out => out)

  destination = File.join($applications_dir, "Finder")
  FileUtils.mv(out, destination)
end

desc "Installs 'OCR PDF Documents'"
task :ocr_pdf_documents => :make_application_dirs do
  src = "ocr_pdf_documents_folder_action.applescript"
  out = "OCR PDF Documents.scpt"
  Rake::Task["compile"].execute(:src => src, :out => out)

  destination = File.join($scripts_dir, "Folder Action Scripts")
  FileUtils.mv(out, destination)
end

desc "Installs 'Make Web Archive' script"
task :make_web_archive => :make_application_dirs do
  src = "make_web_archive_in_yojimbo.applescript"
  out = "Make Web Archive in Yojimbo.scpt"
  Rake::Task["compile"].execute(:src => src, :out => out)

  destination = File.join($applications_dir, "Safari")
  FileUtils.mv(out, destination)
end

desc "Installs 'Drop Items to Yojimbo' script"
task :drop_items_to_yojimbo => :make_application_dirs do
  src = "drop_items_to_yojimbo_folder_action.applescript"
  out = "Drop Items to Yojimbo.scpt"
  Rake::Task["compile"].execute(:src => src, :out => out)

  destination = File.join($scripts_dir, "Folder Action Scripts")
  FileUtils.mv(out, destination)
end

desc "Installs 'Make Comic Book Archive' script"
task :make_comic_book_archive => :make_application_dirs do
  src = "make_comic_book_archive.applescript"
  out = "Make Comic Book Archive.scpt"
  Rake::Task["compile"].execute(:src => src, :out => out)

  destination = File.join($applications_dir, "Finder")
  FileUtils.mv(out, destination)
end
