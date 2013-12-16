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

desc "Compiles a given script"
task :compile_script, :source, :output do |t, args|
  source = args[:source]
  output = args[:output]
  system("osacompile -o \"#{output}\" #{source}")
end

desc "Installs 'Download Podcasts' script"
task :download_podcasts => :make_scripts_dir do
  src = "download_podcasts.applescript"
  out = "Download Podcasts.scpt"
  Rake::Task["compile_script"].invoke(src, out)
  FileUtils.mv(out, $scripts_dir)
end

desc "Installs 'Swithc to Quiet Mode' script"
task :switch_to_quiet_mode => :make_scripts_dir do
  src = "switch_to_quiet_mode.applescript"
  out = "Switch to Quiet Mode.scpt"
  Rake::Task["compile_script"].invoke(src, out)
  FileUtils.mv(out, File.join(Dir.home, $scripts_dir))
end
