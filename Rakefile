$library_dir = File.join(Dir.home, "Library")
$scripts_dir = File.join($library_dir, "Scripts")
$applications_dir = File.join($scripts_dir, "Applications")

$dir_mask = 0700

# Make application specific folder at Library/Scripts/Applications (e.g., Finder)
task :make_application_dir, [:dest_dir, :dir_name] do | t, args |
	dest_dir = args[:dest_dir]
	dir_name = args[:dir_name]
	
	destination = File.join("#{dest_dir}", "#{dir_name}")
	unless File.directory? (destination)
		Dir.mkdir(destination, $dir_mask)
	end
end

task :compile, :src, :out do | t, args |
	src = args[:src]
	out = args[:out]
	
	puts "osacompile -o \"#{out}\" \"#{src}\""
	system("osacompile -o \"#{out}\" \"#{src}\"")
end

task :default => [:install]

desc "Install all scripts"
task :install do
	Rake::Task["install_finder_scripts"].invoke
	Rake::Task["install_carbon_copy_cloner_scripts"].invoke
	Rake::Task["install_garageband_scripts"].invoke
	Rake::Task["install_photos_scripts"].invoke
	Rake::Task["install_miscellaneous_scripts"].invoke
end


desc "Install Finder-related scripts"
task :install_finder_scripts do
	# Create Library/Scripts/Applications/Finder folder
	Rake::Task["make_application_dir"].invoke($applications_dir, "Finder")
	destination = File.join($applications_dir, "Finder")
	
	Rake::Task["compile"].execute(:src => "Finder/close_all_finder_windows.applescript",
	                              :out => "Close All Finder Windows.scpt")
	FileUtils.mv("Close All Finder Windows.scpt", destination)
	
	Rake::Task["compile"].execute(:src => "Finder/eject_all_disks.applescript",
	                              :out => "Eject All Disks.scpt")
	FileUtils.mv("Eject All Disks.scpt", destination)
	
	Rake::Task["compile"].execute(:src => "Finder/km_count_finder_items.applescript",
	                              :out => "KM Count Finder Items.scpt")
	FileUtils.mv("KM Count Finder Items.scpt", destination)
	
	Rake::Task["compile"].execute(:src => "Finder/make_comic_book_archive.applescript", 
	                              :out => "Make Comic Book Archive.scpt")
	FileUtils.mv("Make Comic Book Archive.scpt", destination)
	
	Rake::Task["compile"].execute(:src => "Finder/open_home_folders.applescript",
	                              :out => "Open Home Folders.scpt")
	FileUtils.mv("Open Home Folders.scpt", destination)
end


desc "Install Carbon Copy Cloner-related scripts"
task :install_carbon_copy_cloner_scripts do
	# Create Library/Scripts/Applications/Carbon Copy Cloner
	Rake::Task["make_application_dir"].invoke($applications_dir, "Carbon Copy Cloner")
	destination = File.join($applications_dir, "Carbon Copy Cloner")
	
	Rake::Task["compile"].execute(:src => "Carbon Copy Cloner/backup_audio_recordings.applescript",
	                              :out => "Backup Audio Recordings.scpt")
	FileUtils.mv("Backup Audio Recordings.scpt", destination)
end


desc "Install Garageband-related scripts"
task :install_garageband_scripts do
	# Create Library/Scripts/Applications/GarageBand
	Rake::Task["make_application_dir"].invoke($applications_dir, "GarageBand")
	destination = File.join($applications_dir, "GarageBand")
	
	Rake::Task["compile"].execute(:src => "GarageBand/set_garageband_project_name.applescript",
	                              :out => "Set GarageBand Project Name.scpt")
	FileUtils.mv("Set GarageBand Project Name.scpt", destination)
end


desc "Install Nitro PDF Pro-related scripts"
task :install_nitro_pdf_pro_scripts do
	# Create Library/Scripts/Applications/Nitro PDF Pro
	Rake::Task["make_application_dir"].invoke($applications_dir, "Nitro PDF Pro")
	destination = File.join($applications_dir, "Nitro PDF Pro")
	
	Rake::Task["compile"].execute(:src => "Nitro PDF Pro/ocr_pdf_documents_folder_action.applescript",
	                              :out => "OCR PDF Documents Folder Action.scpt")
	FileUtils.mv("OCR PDF Documents Folder Action.scpt", destination)
	
	Rake::Task["compile"].execute(:src => "Nitro PDF Pro/ocr_pdf_documents_hazel.applescript",
	                              :out => "OCR PDF Documents Hazel.scpt")
	FileUtils.mv("OCR PDF Documents Hazel.scpt", destination)
end


desc "Install Photos-related scripts"
task :install_photos_scripts do
	# Create Library/Scripts/Applications/Photos
	Rake::Task["make_application_dir"].invoke($applications_dir, "Photos")
	destination = File.join($applications_dir, "Photos")
	
	Rake::Task["compile"].execute(:src => "Photos/export_images.applescript",
	                              :out => "Export Images.scpt")
	FileUtils.mv("Export Images.scpt", destination)
end

des "Install Pixelmator Pro-related scripts"
task :install_pixelmator_pro_scripts do
	# Create Library/Scripts/Applications/Pixelmator Pro
	Rake::Task["make_application_dir"].invoke($applications_dir, "Pixelmator Pro")
	destination = File.join($applications_dir, "Pixelmator Pro")
	
	Rake::Task["compile"].execute(:src => "Pixelmator Pro/make_layers_visible.applescript",
								  :out => "Make Layers Visible.scpt")
	Rake::Task["compile"].execute(:src => "Pixelmator Pro/make_layers_invisible.applescript",
								  :out => "Make Layers Invisible.scpt")
end

desc "Install miscellaneous script"
task :install_miscellaneous_scripts do
	Rake::Task["compile"].execute(:src => "show_screen_resolution.applescript",
	                              :out => "Show Screen Resolution.scpt")
	FileUtils.mv("Show Screen Resolution.scpt", $scripts_dir)
	
	Rake::Task["compile"].execute(:src => "open_activity_monitor.applescript",
	                              :out => "Open Activity Monitor.scpt")
	FileUtils.mv("Open Activity Monitor.scpt", $scripts_dir)
	
	Rake::Task["compile"].execute(:src => "switch_to_normal_mode.applescript",
	                              :out => "Switch to Normal Mode.scpt")
	FileUtils.mv("Switch to Normal Mode.scpt", $scripts_dir)

	Rake::Task["compile"].execute(:src => "switch_to_quiet_mode.applescript",
	                              :out => "Switch to Quiet Mode.scpt")
	FileUtils.mv("Switch to Quiet Mode.scpt", $scripts_dir)
end
