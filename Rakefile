#!/usr/bin/env ruby

$library_dir = File.join(Dir.home, "Library")
$scripts_dir = File.join($library_dir, "Foo")
$applications_dir = File.join($scripts_dir, "Applications")

$dir_mask = 0700

task :make_scripts_dir do
  # Create directories like:
  # ~/Library/Scripts
  # ~/Library/Scripts/Applications
  unless File.directory? $scripts_dir
    Dir.mkdir($scripts_dir, $dir_mask)
    system("chmod +a \"everyone deny delete\" #{$scripts_dir}")

    unless File.directory? $applications_dir
      Dir.mkdir($applications_dir, $dir_mask)
    end
  end
end

task :compile, :src, :out do |t, args|
  src = args[:src]
  out = args[:out]
  puts "osacompile -o \"#{out}\" \"#{src}\""
  system("osacompile -o \"#{out}\" \"#{src}\"")
end

desc "Installs 'Download Podcasts' script"
task :download_podcasts => :make_scripts_dir do
  src = "download_podcasts.applescript"
  out = "Download Podcasts.scpt"
  Rake::Task["compile"].invoke(src, out)
  FileUtils.mv(out, $scripts_dir)
end

desc "Installs 'Switch to Quiet Mode' script"
task :switch_to_quiet_mode => :make_scripts_dir do
  src = "switch_to_quiet_mode.applescript"
  out = "Switch to Quiet Mode.scpt"
  Rake::Task["compile"].invoke(src, out)
  FileUtils.mv(out, $scripts_dir)
end

desc "Installs 'Sync with iOS Devices' script"
task :sync_with_ios_devices => :make_scripts_dir do
  src = "sync_with_ios_devices.applescript"
  out = "Sync with iOS Devices.scpt"
  Rake::Task["compile"].invoke(src, out)

  destination = File.join($scripts_dir, "iOS Devices")
  unless File.directory? destination
    Dir.mkdir(destination, $dir_mask)
  end
  FileUtils.mv(out, destination)
end

desc "Installs 'Eject iOS Devices' script"
task :eject_ios_devices => :make_scripts_dir do
  src = "eject_ios_devices.applescript"
  out = "Eject iOS Devices.scpt"
  Rake::Task["compile"].invoke(src, out)

  destination = File.join($scripts_dir, "iOS Devices")
  unless File.directory? destination
    Dir.mkdir(destination, $dir_mask)
  end
  FileUtils.mv(out, destination)
end  

desc "Installs 'Load Song Ratings' script"
task :load_songs_ratings => :make_scripts_dir do
  src = "load_itunes_song_ratings.applescript"
  out = "Load iTunes Song Ratings.scpt"
  Rake::Task["compile"].invoke(src, out)

  destination = File.join($applications_dir, "iTunes")
  unless File.directory? destination
    Dir.mkdir(destination, $dir_mask)
  end
  FileUtils.mv(out, destination)
end

desc "Installs 'Save Song Ratings' script"
task :save_songs_ratings => :make_scripts_dir do
  src = "save_itunes_song_ratings.applescript"
  out = "Save iTunes Song Ratings.scpt"
  Rake::Task["compile"].invoke(src, out)

  destination = File.join($applications_dir, "iTunes")
  unless File.directory? destination
    Dir.mkdir(destination, $dir_mask)
  end
  FileUtils.mv(out, destination)
end

desc "Installs 'Open in Google Chrome' script"
task :open_in_google_chrome => :make_scripts_dir do
  src = "open_in_google_chrome.applescript"
  out = "Open in Google Chrome.scpt"
  Rake::Task["compile"].invoke(src, out)

  destination = File.join($applications_dir, "Safari")
  unless File.directory? destination
    Dir.mkdir(destination, $dir_mask)
  end
  FileUtils.mv(out, destination)
end