$library_dir = File.join(Dir.home, "Library")
$scripts_dir = File.join($library_dir, "Scripts")
$applications_dir = File.join($scripts_dir, "Applications")
$dir_mask = 0700

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
  dir_names.push("iTunes")
  dir_names.push("Safari")
  Rake::Task["make_subdirectory"].invoke($applications_dir, dir_names)

  dir_names = Array.new
  dir_names.push("iOS Devices")
  Rake::Task["make_subdirectory"].reenable
  Rake::Task["make_subdirectory"].invoke($scripts_dir, dir_names)
end

task :compile, :src, :out do |t, args|
  src = args[:src]
  out = args[:out]
  puts "osacompile -o \"#{out}\" \"#{src}\""
  system("osacompile -o \"#{out}\" \"#{src}\"")
end

task :install do
  Rake::Task["download_podcasts"].invoke
  Rake::Task["switch_to_quiet_mode"].invoke
  Rake::Task["sync_with_ios_devices"].invoke
  Rake::Task["eject_ios_devices"].invoke
  Rake::Task["load_song_ratings"].invoke
  Rake::Task["save_song_ratings"].invoke
  Rake::Task["open_in_google_chrome"].invoke
end

desc "Installs 'Download Podcasts' script"
task :download_podcasts => :make_application_dirs do
  src = "download_podcasts.applescript"
  out = "Download Podcasts.scpt"
  Rake::Task["compile"].execute(:src => src, :out => out)
  FileUtils.mv(out, $scripts_dir)
end

desc "Installs 'Switch to Quiet Mode' script"
task :switch_to_quiet_mode => :make_application_dirs do
  src = "switch_to_quiet_mode.applescript"
  out = "Switch to Quiet Mode.scpt"
  Rake::Task["compile"].execute(:src => src, :out => out)
  FileUtils.mv(out, $scripts_dir)
end

desc "Installs 'Sync with iOS Devices' script"
task :sync_with_ios_devices => :make_application_dirs do
  src = "sync_with_ios_devices.applescript"
  out = "Sync with iOS Devices.scpt"
  Rake::Task["compile"].execute(:src => src, :out => out)

  destination = File.join($scripts_dir, "iOS Devices")
  FileUtils.mv(out, destination)
end

desc "Installs 'Eject iOS Devices' script"
task :eject_ios_devices => :make_application_dirs do
  src = "eject_ios_devices.applescript"
  out = "Eject iOS Devices.scpt"
  Rake::Task["compile"].execute(:src => src, :out => out)

  destination = File.join($scripts_dir, "iOS Devices")
  FileUtils.mv(out, destination)
end  

desc "Installs 'Load Song Ratings' script"
task :load_song_ratings => :make_application_dirs do
  src = "load_itunes_song_ratings.applescript"
  out = "Load iTunes Song Ratings.scpt"
  Rake::Task["compile"].execute(:src => src, :out => out)

  destination = File.join($applications_dir, "iTunes")
  FileUtils.mv(out, destination)
end

desc "Installs 'Save Song Ratings' script"
task :save_song_ratings => :make_application_dirs do
  src = "save_itunes_song_ratings.applescript"
  out = "Save iTunes Song Ratings.scpt"
  Rake::Task["compile"].execute(:src => src, :out => out)

  destination = File.join($applications_dir, "iTunes")
  FileUtils.mv(out, destination)
end

desc "Installs 'Open in Google Chrome' script"
task :open_in_google_chrome => :make_application_dirs do
  src = "open_in_google_chrome.applescript"
  out = "Open in Google Chrome.scpt"
  Rake::Task["compile"].execute(:src => src, :out => out)

  destination = File.join($applications_dir, "Safari")
  FileUtils.mv(out, destination)
end
