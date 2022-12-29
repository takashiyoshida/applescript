$library_dir = File.join(Dir.home, "Library")
$scripts_dir = File.join($library_dir, "Scripts")
$applications_dir = File.join($scripts_dir, "Applications")
$dir_mask = 0700

task :default => [:install]

task :make_scripts_dir do
  unless File.directory? $scripts_dir
    Dir.mkdir($scripts_dir, $dir_mask)
    system("chmod +a \"everyone deny delete\" #{$scripts_dir}")
  end
  unless File.directory? $applications_dir
    Dir.mkdir($applications_dir, $dir_mask)
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

desc "Make application folders for scripts"
task :make_application_dirs do
  dir_names = Array.new
  dir_names.push("Carbon Copy Cloner")
  dir_names.push("Finder")
  dir_names.push("GarageBand")
  dir_names.push("OmniFocus")
  dir_names.push("Photos")
  dir_names.push("Safari")
  dir_names.push("Spark")
  # dir_names.push("SuperDuper")
  # dir_names.push("Yojimbo")
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
  # Requires Carbon Copy Cloner
  Rake::Task["backup_audio_recordings"].invoke
  # Requires Finder
  Rake::Task["close_all_finder_windows"].invoke
  Rake::Task["eject_all_disks"].invoke
  Rake::Task["km_count_finder_items"].invoke
  Rake::Task["make_comic_book_archive"].invoke
  Rake::Task["open_home_folders"].invoke
  Rake::Task["show_screen_resolution"].invoke
  # Requires GarageBand
  Rake::Task["set_garageband_project_name"].invoke
  # Requires Photos
  Rake::Task["export_images"].invoke
  # Requires Nitro PDF Pro (formerly PDFpen Pro)
  Rake::Task["ocr_pdf_documents_folder_action"].invoke
  Rake::Task["ocr_pdf_documents_hazel"].invoke
  # Requires SystemEvents and Activity Monitor
  Rake::Task["open_activity_monitor"].invoke
  # Requires Google Chrome and Safari
  Rake::Task["open_in_google_chrome"].invoke
  # Requires Safari
  Rake::Task["save_safari_window_positions"].invoke
  # Requires Spark
  Rake::Task["search_spark_mailbox"].invoke
  Rake::Task["switch_to_normal_mode"].invoke
  Rake::Task["switch_to_quiet_mode"].invoke
  # Requires Yojimbo
  # Rake::Task["backup_boot_drive"].invoke
  # Rake::Task["drop_items_to_yojimbo_folder_action"].invoke
  # Rake::Task["export_images_to_yojimbo"].invoke
  # Rake::Task["make_web_archive_in_yojimbo"].invoke
end

# com.bombich.ccc6.task.open://A241E37B-B1BE-4261-B814-38EEADAF036A
desc "Backup Audio Recordings"
task :backup_audio_recordings => :make_application_dirs do
  src = "backup_audio_recordings.applescript"
  out = "Backup Audio Recordings.scpt"
  Rake::Task["compile"].execute(:src => src, :out => out)

  destination = File.join($applications_dir, "Carbon Copy Cloner")
  FileUtils.mv(out, destination)
end

desc "Backup Boot Drive"
task :backup_boot_drive => :make_application_dirs do
  src = "backup_boot_drive.applescript"
  out = "Backup Boot Drive.scpt"
  Rake::Task["compile"].execute(:src => src, :out => out)

  destination = File.join($applications_dir, "SuperDuper")
  FileUtils.mv(out, destination)
end

desc "Close All Finder Windows"
task :close_all_finder_windows => :make_application_dirs do
  src = "close_all_finder_windows.applescript"
  out = "Close All Finder Windows.scpt"
  Rake::Task["compile"].execute(:src => src, :out => out)
  # This script can be called from any application
  FileUtils.mv(out, $scripts_dir)
end

desc "Drop Items to Yojimbo Folder Action"
task :drop_items_to_yojimbo_folder_action => :make_application_dirs do
  src = "drop_items_to_yojimbo_folder_action.applescript"
  out = "Drop Items to Yojimbo Folder Action.scpt"
  Rake::Task["compile"].execute(:src => src, :out => out)

  destination = File.join($scripts_dir, "Folder Action Scripts")
  FileUtils.mv(out, destination)
end

desc "Eject All Disks"
task :eject_all_disks => :make_application_dirs do
  src = "eject_all_disks.applescript"
  out = "Eject All Disks.scpt"
  Rake::Task["compile"].execute(:src => src, :out => out)
  FileUtils.mv(out, $scripts_dir)
end

desc "Export Images to Yojimbo"
task :export_images_to_yojimbo => :make_application_dirs do
  src = "export_images_to_yojimbo.applescript"
  out = "Export Images to Yojimbo.scpt"
  Rake::Task["compile"].execute(:src => src, :out => out)

  destination = File.join($applications_dir, "Photos")
  FileUtils.mv(out, destination)
end

desc "Export Images"
task :export_images => :make_application_dirs do
  src = "export_images.applescript"
  out = "Export Images.scpt"
  Rake::Task["compile"].execute(:src => src, :out => out)

  destination = File.join($applications_dir, "Photos")
  FileUtils.mv(out, destination)
end

desc "KM Count Finder Items"
task :km_count_finder_items => :make_application_dirs do
  src = "km_count_finder_items.applescript"
  out = "KM Count Finder Items.scpt"
  Rake::Task["compile"].execute(:src => src, :out => out)

  destination = File.join($applications_dir, "Finder")
  FileUtils.mv(out, destination)
end

desc "Make Comic Book Archive"
task :make_comic_book_archive => :make_application_dirs do
  src = "make_comic_book_archive.applescript"
  out = "Make Comic Book Archive.scpt"
  Rake::Task["compile"].execute(:src => src, :out => out)

  destination = File.join($applications_dir, "Finder")
  FileUtils.mv(out, destination)
end

desc "Make Web Archive in Yojimbo"
task :make_web_archive_in_yojimbo => :make_application_dirs do
  src = "make_web_archive_in_yojimbo.applescript"
  out = "Make Web Archive in Yojimbo.scpt"
  Rake::Task["compile"].execute(:src => src, :out => out)

  destination = File.join($applications_dir, "Safari")
  FileUtils.mv(out, destination)
end

desc "Open Activity Monitor"
task :open_activity_monitor => :make_application_dirs do
  src = "open_activity_monitor.applescript"
  out = "Open Activity Monitor.scpt"
  Rake::Task["compile"].execute(:src => src, :out => out)
  FileUtils.mv(out, $scripts_dir)
end

desc "OCR PDF Documents Folder Action"
task :ocr_pdf_documents_folder_action => :make_application_dirs do
  src = "ocr_pdf_documents_folder_action.applescript"
  out = "OCR PDF Documents Folder Action.scpt"
  Rake::Task["compile"].execute(:src => src, :out => out)

  destination = File.join($scripts_dir, "Folder Action Scripts")
  FileUtils.mv(out, destination)
end

desc "OCR PDF Documents Hazel"
task :ocr_pdf_documents_hazel => :make_application_dirs do
  src = "ocr_pdf_documents_hazel.applescript"
  out = "OCR PDF Documents Hazel.scpt"
  Rake::Task["compile"].execute(:src => src, :out => out)

  destination = File.join($scripts_dir, "Folder Action Scripts")
  FileUtils.mv(out, destination)
end

desc "Open Activity Monitor - Energy"
task :open_activity_monitor => :make_application_dirs do
  src = "open_activity_monitor.applescript"
  out = "Open Activity Monitor.scpt"
  Rake::Task["compile"].execute(:src => src, :out => out)
  FileUtils.mv(out, $scripts_dir)
end

desc "Open Home Folders"
task :open_home_folders => :make_application_dirs do
  src = "open_home_folders.applescript"
  out = "Open Home Folders.scpt"
  Rake::Task["compile"].execute(:src => src, :out => out)
  FileUtils.mv(out, $scripts_dir)
end

desc "Open in Google Chrome"
task :open_in_google_chrome => :make_application_dirs do
  src = "open_in_google_chrome.applescript"
  out = "Open in Google Chrome.scpt"
  Rake::Task["compile"].execute(:src => src, :out => out)
  destination = File.join($applications_dir, "Safari")
  FileUtils.mv(out, destination)
end

desc "Save Safari Window Positions"
task :save_safari_window_positions => :make_application_dirs do
  src = "save_safari_window_pos.applescript"
  out = "Save Safari Window Positions.scpt"
  Rake::Task["compile"].execute(:src => src, :out => out)

  destination = File.join($applications_dir, "Safari")
  FileUtils.mv(out, destination)
end

desc "Search Spark Mailbox"
task :search_spark_mailbox => :make_application_dirs do
  src = "search_spark_mailbox.applescript"
  out = "Search Spark Mailbox.scpt"
  Rake::Task["compile"].execute(:src => src, :out => out)

  destination = File.join($applications_dir, "Spark")
  FileUtils.mv(out, destination)
end

desc "Set GarageBand Project Name"
task :set_garageband_project_name => :make_application_dirs do
  src = "set_garageband_project_name.applescript"
  out = "Set GarageBand Project Name.scpt"
  Rake::Task["compile"].execute(:src => src, :out => out)

  destination = File.join($applications_dir, "GarageBand")
  FileUtils.mv(out, destination)
end

desc "Show Screen Resolution"
task :show_screen_resolution => :make_application_dirs do
  src = "show_screen_resolution.applescript"
  out = "Show Screen Resolution.scpt"
  Rake::Task["compile"].execute(:src => src, :out => out)
  FileUtils.mv(out, $scripts_dir)
end

desc "Switch to Normal Mode"
task :switch_to_normal_mode => :make_application_dirs do
  src = "switch_to_normal_mode.applescript"
  out = "Switch to Normal Mode.scpt"
  Rake::Task["compile"].execute(:src => src, :out => out)
  FileUtils.mv(out, $scripts_dir)
end

desc "Switch to Quiet Mode"
task :switch_to_quiet_mode => :make_application_dirs do
  src = "switch_to_quiet_mode.applescript"
  out = "Switch to Quiet Mode.scpt"
  Rake::Task["compile"].execute(:src => src, :out => out)
  FileUtils.mv(out, $scripts_dir)
end

desc "OmniFocus - Open Inbox perspective"
task :omnifocus_open_inbox => :make_application_dirs do
  src = "omnifocus_open_inbox.applescript"
  out = "OmniFocus - Open Inbox.scpt"
  Rake::Task["compile"].execute(:src => src, :out => out)

  destination = File.join($applications_dir, "OmniFocus")
  FileUtils.mv(out, destination)
end

desc "OmniFocus - Open Forecast perspective"
task :omnifocus_open_forecast => :make_application_dirs do
  src = "omnifocus_open_forecast.applescript"
  out = "OmniFocus - Open Forecast.scpt"
  Rake::Task["compile"].execute(:src => src, :out => out)

  destination = File.join($applications_dir, "OmniFocus")
  FileUtils.mv(out, destination)
end

desc "OmniFocus - Open Projects perspective"
task :omnifocus_open_projects => :make_application_dirs do
  src = "omnifocus_open_projects.applescript"
  out = "OmniFocus - Open Projects.scpt"
  Rake::Task["compile"].execute(:src => src, :out => out)

  destination = File.join($applications_dir, "OmniFocus")
  FileUtils.mv(out, destination)
end

desc "OmniFocus - Open Flagged perspective"
task :omnifocus_open_flagged => :make_application_dirs do
  src = "omnifocus_open_flagged.applescript"
  out = "OmniFocus - Open Flagged.scpt"
  Rake::Task["compile"].execute(:src => src, :out => out)

  destination = File.join($applications_dir, "OmniFocus")
  FileUtils.mv(out, destination)
end

desc "OmniFocus - Open Review perspective"
task :omnifocus_open_review => :make_application_dirs do
  src = "omnifocus_open_review.applescript"
  out = "OmniFocus - Open Review.scpt"
  Rake::Task["compile"].execute(:src => src, :out => out)

  destination = File.join($applications_dir, "OmniFocus")
  FileUtils.mv(out, destination)
end

desc "OmniFocus - Open Tags perspective"
task :omnifocus_open_tags => :make_application_dirs do
  src = "omnifocus_open_tags.applescript"
  out = "OmniFocus - Open Tags.scpt"
  Rake::Task["compile"].execute(:src => src, :out => out)

  destination = File.join($applications_dir, "OmniFocus")
  FileUtils.mv(out, destination)
end
