            #Encoding: UTF-8
puts "Test: Base File\n"

require "rubygems"
gem "test-unit"
require "test/unit"
require "timeout"

#require "watir-webdriver"
require "watir"
require "selenium-webdriver"

require "./test_case_run_method"

require "rautomation"

require 'watir-scroll'

require "colorize"

# check arguments for browser or headless specification
ARGV.each { |arg|
    if arg.downcase.include? 'chrome'
      $browser = 'chrome'
    elsif arg.downcase.include? 'firefox'
      $browser = 'firefox'
    elsif arg.downcase.include? 'ff'
      $browser = 'firefox'
    elsif arg.downcase.include? 'ie'
    elsif arg.d      $browser = 'ie'
owncase.include? 'headless'
      $headless = true
    end
}

if $browser == 'ie'
  require "watir"
  #require "watir-classic"
else
  #require "watir-webdriver"
  require "watir"
  require "selenium-webdriver"
end

class TestExample < Test::Unit::TestCase

  class << self


	  def startup
      @@browser = $browser

      @@browser = 'firefox' if $browser.nil?
      #@@browser = 'chrome' if $browser.nil?
      #@@browser = 'ie' if $browser.nil?

      puts "Browser: #{@@browser}\n"
#Give website Link
      @@site = 'https://fW' if $site.nil?
      @@prod_mode = false
      #@@site = 'https://fW if $site.nil?
      #@@prod_mode = true

      if $headless
        require 'headless'
        $headless = Headless.new
        $headless.start
      end

      time = Time.new

      if @@browser == 'chrome'

        #@@client = Selenium::WebDriver::Remote::Http::Default.new
        #@@client.timeout = 120 # seconds
        @@client = Selenium::WebDriver::Remote::Http::Default.new
        @@client.timeout = 120 # seconds
        puts "#{time.strftime('%Y.%m.%d %H:%M:%S')} - #{self.name}.#{__method__.to_s}: @@client.timeout = #{@@client.timeout}\n"
        ##puts "#{time.strftime('%Y.%m.%d %H:%M:%S')} - #{self.to_s}.#{__method__.to_s}: @@client.timeout = #{@@client.timeout}\n"

        #@@b = Watir::Browser.new :chrome
        #@@b = Watir::Browser.new(:remote, :url => "http://localhost:9515")

        #@@b.driver.manage.timeouts.implicit_wait = 3
        #@@b.driver.manage.timeouts.page_load = 30


        # Specify the driver path
        #chromedriver_path = File.join(File.absolute_path('../..', File.dirname(__FILE__)),"browsers","chromedriver.exe")
        #chromedriver_path = File.join(File.absolute_path('./', File.dirname(__FILE__)), "chromedriver.exe")
        #chromedriver_path = File.join(File.absolute_path('E:/Watir/Downloads/chromedriver_win32', File.dirname(__FILE__)), "chromedriver.exe")
        #chromedriver_path = File.join(File.absolute_path('C:\Program Files (x86)\Google\Chrome\Application', File.dirname(__FILE__)), "chrome.exe")
        #Selenium::WebDriver::Chrome.driver_path = chromedriver_path

        #Selenium::WebDriver::Chrome::Binary.path = 'C:\Program Files (x86)\Google\Chrome\Application\chrome.exe'

        # Start the browser as normal
        #Selenium::WebDriver::Chrome.path = 'C:\Program Files (x86)\Google\Chrome\Application\chrome.exe'
        #Selenium::WebDriver::Chrome.path = 'E:\Watir\Frameworks\Test_Framework11\Testing_Test_Security\Overnight_Testrun\Testing\Improvements\chromedriver.exe'
        #driver = Selenium::WebDriver.for :chrome
        #@@b = Watir::Browser.new driver
        #@@b = Watir::Browser.new :chrome

        require 'selenium-webdriver'
        Selenium::WebDriver::Chrome.driver_path="E:/Watir/Frameworks/Test_Framework11/Testing_Test_Security/Overnight_Testrun/Testing/Improvements/chromedriver.exe"
        driver = Selenium::WebDriver.for :chrome
        driver.get("http://google.com")

      elsif @@browser == 'firefox'

        #Selenium::WebDriver::Firefox::Binary.path = "D:/Program Files (x86)/Mozilla Firefox/firefox.exe"
        Selenium::WebDriver::Firefox::Binary.path = "C:/Program Files (x86)/Mozilla Firefox/firefox.exe"
        @@client = Selenium::WebDriver::Remote::Http::Default.new
        @@client.timeout = 120 # seconds
        puts "#{time.strftime('%Y.%m.%d %H:%M:%S')} - #{self.name}.#{__method__.to_s}: @@client.timeout = #{@@client.timeout}\n"
        #puts "#{time.strftime('%Y.%m.%d %H:%M:%S')} - #{self.to_s}.#{__method__.to_s}: @@client.timeout = #{@@client.timeout}\n"

        @@b = Watir::Browser.new :firefox, :http_client => @@client
        #@@b = Watir::Browser.new :ff

        @@b.driver.manage.timeouts.implicit_wait = 3
        @@b.driver.manage.timeouts.page_load = 30

      elsif @@browser == 'ie'

        require "watir-webdriver"

        #@@client = Watir::Remote::Http::Default.new
        #@@client.timeout = 120 # seconds
        @@client = Selenium::WebDriver::Remote::Http::Default.new
        @@client.timeout = 120 # seconds
        puts "#{time.strftime('%Y.%m.%d %H:%M:%S')} - #{self.name}.#{__method__.to_s}: @@client.timeout = #{@@client.timeout}\n"
        ##puts "#{time.strftime('%Y.%m.%d %H:%M:%S')} - #{self.to_s}.#{__method__.to_s}: @@client.timeout = #{@@client.timeout}\n"

        @@b = Watir::Browser.new :ie, :http_client => @@client
        #@@b = Watir::Browser.new :ie

        @@b.driver.manage.timeouts.implicit_wait = 3
        @@b.driver.manage.timeouts.page_load = 30

      end

      puts "#{time.strftime('%Y.%m.%d %H:%M:%S')} - #{self.name}.#{__method__.to_s}: @@browser = #{@@browser} --- @@b = #{@@b}\n"
      #puts "#{time.strftime('%Y.%m.%d %H:%M:%S')} - #{self.to_s}.#{__method__.to_s}: @@browser = #{@@browser} --- @@b = #{@@b}\n"

=begin
      File.open(File.dirname(__FILE__) + '/' + 'Results' + '/' + 'results.csv', 'a+'){|f|
        f << "Time;"
        f << "Method;"
        f << "Result;\n"
      }
=end
    end

    def shutdown
      time = Time.new
      puts "#{time.strftime('%Y.%m.%d %H:%M:%S')} - #{self.name}.#{__method__.to_s}: @@browser = #{@@browser} --- @@b = #{@@b}\n"
      #puts "#{time.strftime('%Y.%m.%d %H:%M:%S')} - #{self.to_s}.#{__method__.to_s}: @@browser = #{@@browser} --- @@b = #{@@b}\n"

      @@b.close

      if $headless
        $headless.destroy
      end
    end

  end

  def run(*args)
    result = super
    #time = Time.new
    #puts "#{time.strftime('%Y.%m.%d %H:%M:%S')} - #{self.class.name}.run: result = #{result}\n"
    #puts "#{time.strftime('%Y.%m.%d %H:%M:%S')} - #{self.class.name}.run: args = #{args}\n"
    #puts "#{time.strftime('%Y.%m.%d %H:%M:%S')} - #{self.class.to_s}.run: result = #{result}\n"
    #puts "#{time.strftime('%Y.%m.%d %H:%M:%S')} - #{self.class.to_s}.run: args = #{args}\n"
    result
  end

  # setup is run before every test
  def setup
    #@timeout_length = 30
    #@timeout_error_length = @timeout_length/3.0
    #@max_retries = 3
    #@timeout_length = 60
    #@timeout_error_length = @timeout_length/3.0
    #@max_retries = 3
    @timeout_length = 120
    @timeout_error_length = @timeout_length/6.0
    @max_retries = 6

    time = Time.new
    puts "#{time.strftime('%Y.%m.%d %H:%M:%S')} - #{self.class.name}.#{__method__.to_s}: @@browser = #{@@browser} --- @@b = #{@@b}\n"
    #puts "#{time.strftime('%Y.%m.%d %H:%M:%S')} - #{self.class.to_s}.#{__method__.to_s}: @@browser = #{@@browser} --- @@b = #{@@b}\n"

    @element = nil

    #@load_link_message = "goto #{@@site}"
    #load_link(@timeout_length){ @@b.goto @@site }
  end

  def cleanup
  end

  # teardown is run after every test
  def teardown
    time = Time.new

    if passed?
      #puts "#{time.strftime('%Y.%m.%d %H:%M:%S')} - #{self.class.name}.#{__method__.to_s}: PASS\n"
      #puts "#{time.strftime('%Y.%m.%d %H:%M:%S')} - #{self.class.name}.#{__method__.to_s}: PASS\n".green
      puts "#{time.strftime('%Y.%m.%d %H:%M:%S')} - #{self.class.name}.#{__method__.to_s}: " + "PASS\n".green
      #puts "#{time.strftime('%Y.%m.%d %H:%M:%S')} - #{self.class.to_s}.#{__method__.to_s}: PASS\n"
    else
      #puts "#{time.strftime('%Y.%m.%d %H:%M:%S')} - #{self.class.name}.#{__method__.to_s}: FAIL\n"
      #puts "#{time.strftime('%Y.%m.%d %H:%M:%S')} - #{self.class.name}.#{__method__.to_s}: FAIL\n".red
      puts "#{time.strftime('%Y.%m.%d %H:%M:%S')} - #{self.class.name}.#{__method__.to_s}: " + "FAIL\n".red
      #puts "#{time.strftime('%Y.%m.%d %H:%M:%S')} - #{self.class.to_s}.#{__method__.to_s}: FAIL\n"

      # take screenshot at end of test, useful for failures/errors
      #@@b.driver.save_screenshot(File.dirname(__FILE__) + '/Screenshots/' + @method_name + '_' + time.strftime('%Y%m%d_%H%M%S') + '.png');
      #@@b.driver.save_screenshot(File.dirname(__FILE__) + '/' + 'Screenshot' + '_' + self.inspect.to_s + '_' + time.strftime('%Y%m%d_%H%M%S') + '.png');
      #@@b.driver.save_screenshot(File.dirname(__FILE__) + '/' + 'Screenshot' + '_' + __callee__.to_s + '_' + time.strftime('%Y%m%d_%H%M%S') + '.png');
      #@@b.driver.save_screenshot(File.dirname(__FILE__) + '/' + 'Screenshot' + '_' + __method__.to_s + '_' + time.strftime('%Y%m%d_%H%M%S') + '.png');
      #@@b.driver.save_screenshot(File.dirname(__FILE__) + '/Screenshots/' + "[#{self.class.name}" + '#' + "#{__method__.to_s}]" + '_' + time.strftime('%Y%m%d_%H%M%S') + '.png');
      #@@b.driver.save_screenshot(File.dirname(__FILE__) + '/Screenshots/' + "[#{self.class.to_s}" + '#' + "#{__method__.to_s}]" + '_' + time.strftime('%Y%m%d_%H%M%S') + '.png');
      #time += 1
      #@@b.screenshot.save(File.dirname(__FILE__) + '/Screenshots/' + "[#{self.class.name}" + '#' + "#{__method__.to_s}]" + '_' + (Time.new + 1).strftime('%Y%m%d_%H%M%S') + '.png');
      #@@b.screenshot.save(File.dirname(__FILE__) + '/Screenshots/' + "[#{self.class.to_s}" + '#' + "#{__method__.to_s}]" + '_' + (Time.new + 1).strftime('%Y%m%d_%H%M%S') + '.png');

#=begin
      @@b.driver.save_screenshot(File.dirname(__FILE__) + '/Screenshots/' + "[#{self.class.name}" + '#' + "#{method_name}]" + '_' + time.strftime('%Y%m%d_%H%M%S') + '.png');
      #@@b.driver.save_screenshot(File.dirname(__FILE__) + '/Screenshots/' + "[#{self.class.to_s}" + '#' + "#{method_name}]" + '_' + time.strftime('%Y%m%d_%H%M%S') + '.png');
#=end

      #puts File.dirname(__FILE__) + '/' + 'Screenshot' + '_' + "[#{self.class.name}" + '#' + "#{__method__.to_s}]" + '_' + time.strftime('%Y%m%d_%H%M%S') + '.png\n'
      #puts File.dirname(__FILE__) + '/' + 'Screenshot' + '_' + "[#{self.class.to_s}" + '#' + "#{__method__.to_s}]" + '_' + time.strftime('%Y%m%d_%H%M%S') + '.png\n'
      puts "#{time.strftime('%Y.%m.%d %H:%M:%S')} - #{self.class.name}.teardown: Screenshot saved to " + File.dirname(__FILE__) + '/' + 'Screenshot' + '_' + "[#{self.class.name}" + '#' + "#{method_name}]" + '_' + time.strftime('%Y%m%d_%H%M%S') + '.png' + "\n"
      #puts "#{time.strftime('%Y.%m.%d %H:%M:%S')} - #{self.class.to_s}.teardown: Screenshot saved to " + File.dirname(__FILE__) + '/' + 'Screenshot' + '_' + "[#{self.class.to_s}" + '#' + "#{method_name}]" + '_' + time.strftime('%Y%m%d_%H%M%S') + '.png' + "\n"
    end

    time = Time.new
    File.open(File.dirname(__FILE__) + '/' + 'Results' + '/' + 'results.csv', 'a+'){|f|
      f << time.strftime('%Y%m%d') + ";"
      f << time.strftime('%H%M%S') + ";"
      f << "#{self.class.to_s}" + '#' + "#{method_name}" + ";"
      f << (passed? ? ";" : "#{@message};")
      f << (passed? ? "PASS;" : "FAIL;")
      f << "\n"
    }
  end

  def browse_to_new_project
    @load_link_message = "browse to #{@@site}"
    load_link(@timeout_length){ @@b.goto @@site }
  end

  def login_to_portal
    @load_link_message = "login to portal"
    load_link(@timeout_length){

       if @@prod_mode
        # Produktiv Portal
        @@b.text_field(:name => 'username').set '***'
        @@b.text_field(:name => 'password').set '***'
      else
        # Test Portal
        @@b.text_field(:name => 'username').set '****'
        @@b.text_field(:name => 'password').set '****'
      end

      @@b.button(:id => 'submitProperty').click

      time = Time.new

      sleep (2)

      if @@b.button(:text => 'Ok').visible?
        #puts "#{time.strftime('%Y.%m.%d %H:%M:%S')} - Button 'Ok' visible\n"
        @@b.button(:text => 'Ok').click
      else
        #puts "#{time.strftime('%Y.%m.%d %H:%M:%S')} - Button 'Ok' not visible\n"
      end
    }
  end

  def logout_from_portal

    #To check the scroll version

    #scroll_to_version_ctrl()

    scroll_ver =  Gem.loaded_specs["watir-scroll"].version

    if scroll_ver == '0.1.0'
      @@b.scroll.to @@b.element(:xpath => "//li[@id='abmelden']/a/span")
      sleep 1

      #@@b.scroll.to :top
      #sleep 1

      # Use for watir-scroll > watir-scroll-0.1.0
    else
      @@b.element(:xpath => "//li[@id='abmelden']/a/span").scroll.to
      sleep 1
    end

    @load_link_message = "logout from portal"
    load_link(@timeout_length){
      #@@b.element(:xpath => "//li[@id='abmelden']/a/font").click
      @@b.element(:xpath => "//li[@id='abmelden']/a/span").click
    }
  end

  def scroll_to_version_ctrl(pathvar)
    scroll_ver =  Gem.loaded_specs["watir-scroll"].version

    if scroll_ver == '0.1.0'
      @@b.scroll.to @@b.element(:xpath => "#{pathvar}")
      sleep 1

    else
      @@b.element(:xpath => "#{pathvar}").scroll.to
      sleep 1
    end
  end

  def visiblity_check(pathvar)
    while (pathvar.visible?)
      end_time = Time.now.strftime("%d/%m/%Y %H:%M:%S")
    end

    puts "End time : " + "#{end_time}" + "\n"
  end

  def load_link(waittime, print = true)
    begin
      #time = Time.new
      #puts "\n#{time.strftime('%Y.%m.%d %H:%M:%S')} - load_link(#{waittime}): ---> Timeout::timeout(#{waittime})"
      Timeout::timeout(waittime) do
        time = Time.new
        #puts "#{time.strftime('%Y.%m.%d %H:%M:%S')} - Timeout::timeout: " + @load_link_message + "\n" if print
        puts "#{time.strftime('%Y.%m.%d %H:%M:%S')} - Timeout::timeout: " + @load_link_message.yellow + "\n" if print
        yield
        #time = Time.new
        #puts "#{time.strftime('%Y.%m.%d %H:%M:%S')} - Timeout::timeout: " + "DONE" + "\n" if print
      end
    rescue Timeout::Error => e
      time = Time.new
      if @element == nil
        puts "#{time.strftime('%Y.%m.%d %H:%M:%S')} - Timeout::Error occurred:\n #{e}\n"
      else
        #puts "#{time.strftime('%Y.%m.%d %H:%M:%S')} - Timeout::Error occurred:\n @element.tag_name = #{@element.tag_name}\n @element.text = #{@element.text}\n @element.html = #{@element.html}\n #{e}\n"
        puts "#{time.strftime('%Y.%m.%d %H:%M:%S')} - Timeout::Error occurred:\n @element.tag_name = #{@element.tag_name}\n @element.text = #{@element.text}\n @element.html = #{@element.html.slice(0, 120)} ...\n #{e}\n"
      end
      retries ||= 0
      puts "#{time.strftime('%Y.%m.%d %H:%M:%S')} - Timeout::Error: retries = #{retries}\n"
      if retries < @max_retries
        retries += 1
        retry
      else
        puts "#{time.strftime('%Y.%m.%d %H:%M:%S')} - Timeout::Error: raise Timeout::Error\n"
        raise e
      end
    rescue Exception => e
      time = Time.new
      if @element == nil
        puts "#{time.strftime('%Y.%m.%d %H:%M:%S')} - Exception occurred:\n #{e}\n"
      else
        #puts "#{time.strftime('%Y.%m.%d %H:%M:%S')} - Exception occurred:\n @element.tag_name = #{@element.tag_name}\n @element.text = #{@element.text}\n @element.html = #{@element.html}\n #{e}\n"
        #puts "#{time.strftime('%Y.%m.%d %H:%M:%S')} - Exception occurred:\n @element.tag_name = #{@element.tag_name}\n @element.text = #{@element.text}\n @element.html = #{@element.html.slice(0, 120)} ...\n #{e}\n"
        puts "#{time.strftime('%Y.%m.%d %H:%M:%S')} - " + "Exception occurred:\nElement:\n@element.tag_name = #{@element.tag_name}\n@element.text = #{@element.text}\n@element.html = #{@element.html.slice(0, 120)} ...\n #{e}\n".cyan
      end
      retries ||= 0
      #puts "#{time.strftime('%Y.%m.%d %H:%M:%S')} - Exception: retries = #{retries}\n"
      puts "#{time.strftime('%Y.%m.%d %H:%M:%S')} - " + "Exception: retries = #{retries}\n".cyan
      if retries < @max_retries
        retries += 1
        time_to_wait = (Float(waittime) / @max_retries).round
        #puts "#{time.strftime('%Y.%m.%d %H:%M:%S')} - Exception: time_to_wait = #{time_to_wait}\n"
        puts "#{time.strftime('%Y.%m.%d %H:%M:%S')} - " + "Exception: time_to_wait = #{time_to_wait}\n".cyan
        sleep time_to_wait
        retry
      else
        #puts "#{time.strftime('%Y.%m.%d %H:%M:%S')} - Exception: raise Exception\n"
        puts "#{time.strftime('%Y.%m.%d %H:%M:%S')} - " + "Exception: raise Exception\n".cyan
        raise e
      end
    rescue Selenium::WebDriver::Error::StaleElementReferenceError => e
      time = Time.new
      if @element == nil
        puts "#{time.strftime('%Y.%m.%d %H:%M:%S')} - Selenium::WebDriver::Error::StaleElementReferenceError occurred:\n #{e}\n"
      else
        #puts "#{time.strftime('%Y.%m.%d %H:%M:%S')} - Selenium::WebDriver::Error::StaleElementReferenceError occurred:\n @element.tag_name = #{@element.tag_name}\n @element.text = #{@element.text}\n @element.html = #{@element.html}\n #{e}\n"
        puts "#{time.strftime('%Y.%m.%d %H:%M:%S')} - Selenium::WebDriver::Error::StaleElementReferenceError occurred:\n @element.tag_name = #{@element.tag_name}\n @element.text = #{@element.text}\n @element.html = #{@element.html.slice(0, 120)} ...\n #{e}\n"
      end
      retries ||= 0
      puts "#{time.strftime('%Y.%m.%d %H:%M:%S')} - Selenium::WebDriver::Error::StaleElementReferenceError: retries = #{retries}\n"
      if retries < @max_retries
        retries += 1
        retry
      else
        puts "#{time.strftime('%Y.%m.%d %H:%M:%S')} - Selenium::WebDriver::Error::StaleElementReferenceError: raise Error\n"
        raise e
      end
    rescue Selenium::WebDriver::Error::ElementNotVisibleError => e
      time = Time.new
      if @element == nil
        puts "#{time.strftime('%Y.%m.%d %H:%M:%S')} - Selenium::WebDriver::Error::ElementNotVisibleError occurred:\n #{e}\n"
      else
        #puts "#{time.strftime('%Y.%m.%d %H:%M:%S')} - Selenium::WebDriver::Error::ElementNotVisibleError occurred:\n @element.tag_name = #{@element.tag_name}\n @element.text = #{@element.text}\n @element.html = #{@element.html}\n #{e}\n"
        puts "#{time.strftime('%Y.%m.%d %H:%M:%S')} - Selenium::WebDriver::Error::ElementNotVisibleError occurred:\n @element.tag_name = #{@element.tag_name}\n @element.text = #{@element.text}\n @element.html = #{@element.html.slice(0, 120)} ...\n #{e}\n"
      end
      retries ||= 0
      puts "#{time.strftime('%Y.%m.%d %H:%M:%S')} - Selenium::WebDriver::Error::ElementNotVisibleError: retries = #{retries}\n"
      if retries < @max_retries
        retries += 1
        time_to_wait = (Float(waittime) / @max_retries).round
        puts "#{time.strftime('%Y.%m.%d %H:%M:%S')} - Selenium::WebDriver::Error::ElementNotVisibleError: time_to_wait = #{time_to_wait}\n"
        sleep time_to_wait
        retry
      else
        puts "#{time.strftime('%Y.%m.%d %H:%M:%S')} - Selenium::WebDriver::Error::ElementNotVisibleError: raise Error\n"
        raise e
      end
    rescue Net::ReadTimeout => e
      time = Time.new
      if @element == nil
        puts "#{time.strftime('%Y.%m.%d %H:%M:%S')} - Net::ReadTimeout occurred:\n #{e}\n"
      else
        #puts "#{time.strftime('%Y.%m.%d %H:%M:%S')} - Net::ReadTimeout occurred:\n @element.tag_name = #{@element.tag_name}\n @element.text = #{@element.text}\n @element.html = #{@element.html}\n #{e}\n"
        puts "#{time.strftime('%Y.%m.%d %H:%M:%S')} - Net::ReadTimeout occurred:\n @element.tag_name = #{@element.tag_name}\n @element.text = #{@element.text}\n @element.html = #{@element.html.slice(0, 120)} ...\n #{e}\n"
      end
      retries ||= 0
      puts "#{time.strftime('%Y.%m.%d %H:%M:%S')} - Net::ReadTimeout: retries = #{retries}\n"
      if retries < @max_retries
        retries += 1
        time_to_wait = (Float(waittime) / @max_retries).round
        puts "#{time.strftime('%Y.%m.%d %H:%M:%S')} - Net::ReadTimeout: time_to_wait = #{time_to_wait}\n"
        sleep time_to_wait
        retry
      else
        puts "#{time.strftime('%Y.%m.%d %H:%M:%S')} - Net::ReadTimeout: raise Error\n"
        raise e
      end
    rescue Error => e
      time = Time.new
      if @element == nil
        puts "#{time.strftime('%Y.%m.%d %H:%M:%S')} - Error occurred:\n #{e}\n"
      else
        #puts "#{time.strftime('%Y.%m.%d %H:%M:%S')} - Error occurred:\n @element.tag_name = #{@element.tag_name}\n @element.text = #{@element.text}\n @element.html = #{@element.html}\n #{e}\n"
        puts "#{time.strftime('%Y.%m.%d %H:%M:%S')} - Error occurred:\n @element.tag_name = #{@element.tag_name}\n @element.text = #{@element.text}\n @element.html = #{@element.html.slice(0, 120)} ...\n #{e}\n"
      end
      retries ||= 0
      puts "#{time.strftime('%Y.%m.%d %H:%M:%S')} - Error: retries = #{retries}\n"
      if retries < @max_retries
        retries += 1
        retry
      else
        puts "#{time.strftime('%Y.%m.%d %H:%M:%S')} - Error: raise Error\n"
        raise e
      end
    end
  end

  def load_link_assert(waittime, tag, target, text)
    load_link(waittime, false){
      @element = eval("@@b." + tag + "(:" + target + " => \"" + text + "\")")
      assert_true @element.exists?
    }
  end

  def load_link_assert_present(waittime, tag, target, text)
    load_link(waittime, false){
      @element = eval("@@b." + tag + "(:" + target + " => \"" + text + "\")")
      assert_true @element.present?
    }
  end

  def load_link_assert_visible(waittime, tag, target, text)
    load_link(waittime, false){
      @element = eval("@@b." + tag + "(:" + target + " => \"" + text + "\")")
      assert_true @element.visible?
    }
  end

  def load_link_assert_include_text(waittime, tag, target, text, text_included)
    load_link(waittime, false){
      @element = eval("@@b." + tag + "(:" + target + " => \"" + text + "\")")
      assert_true eval("@element.text.include?('" + text_included + "')")
    }
  end

  def load_link_wait_until_exist(waittime, tag1, target1, text1, tag2, target2, text2)
    load_link(waittime){
      @element1 = eval("@@b." + tag1 + "(:" + target1 + " => \"" + text1 + "\")")
      @@b.wait_until{@element1.visible?}
      @element1.click
      @element2 = eval("@@b." + tag2 + "(:" + target2 + ", \"" + text2 + "\")")
      #@element2 = nil unless @element2.exists?
      @@b.wait_until{@element2.exists?}
    }
  end

  def load_link_wait_until_visible(waittime, tag1, target1, text1, tag2, target2, text2)
    load_link(waittime){
      @element1 = eval("@@b." + tag1 + "(:" + target1 + " => \"" + text1 + "\")")
      @element1.click
      @element2 = eval("@@b." + tag2 + "(:" + target2 + ", \"" + text2 + "\")")
      if not @element2.visible?
        @@b.wait_until{@element2.visible?}
      end
    }
  end

  def load_link_wait_until_present(waittime, tag1, target1, text1, tag2, target2, text2)
    load_link(waittime){

      #puts "\n"
      #puts "@@b." + tag1 + "(:" + target1 + " => \"" + text1 + "\")"
      #puts "\n"

      @element1 = eval("@@b." + tag1 + "(:" + target1 + " => \"" + text1 + "\")")

      #puts "\n"
      #puts @element1
      #puts "\n"
      #puts @element1.tag_name
      #puts "\n"

      @element1.click

      #puts "\n"
      #puts "@@b." + tag2 + "(:" + target2 + " => \"" + text2 + "\")"
      #puts "\n"

      @element2 = eval("@@b." + tag2 + "(:" + target2 + ", \"" + text2 + "\")")

      #puts "\n"
      #puts @element2
      #puts "\n"
      #puts @element2.tag_name
      #puts "\n"

      #@element2 = nil unless @element2.present?
      @element2.wait_until_present
    }
  end

  def load_link_wait_until_exist_after_select(waittime, tag1, target1, text1, text_selected, tag2, target2, text2)
    load_link(waittime){
      @element1 = eval("@@b." + tag1 + "(:" + target1 + " => \"" + text1 + "\")")
      @element1.select text_selected
      @element2 = eval("@@b." + tag2 + "(:" + target2 + ", \"" + text2 + "\")")
      #@element2 = nil unless @element2.exists?
      @@b.wait_until{@element2.exists?}
    }
  end

  def write_result_to_file
    time = Time.new
    File.open(File.dirname(__FILE__) + '/' + 'Results' + '/' + 'results.csv', 'a+'){|f|
      f << time.strftime('%Y%m%d') + ";"
      f << time.strftime('%H%M%S') + ";"
      f << "#{self.class.to_s}" + '#' + "#{method_name}" + ";"
      f << "#{@message}" + ";"
      f << (passed? ? "PASS;" : "FAIL;")
      f << "\n"
    }
  end

=begin
  def assert_true(actual, message = nil)
    assert actual == true, message + "#{actual} should be true!"
  end
=end

  def assert_true(actual, message = nil)
    _wrap_assertion do
      if @element == nil
        full_message = build_message(message, "<?> should be true!", actual)
      else
        #full_message = build_message("Element:\n @element.tag_name = #{@element.tag_name}\n @element.text = #{@element.text}\n @element.html = #{@element.html}\n " + message.to_s, "<?> should be true!", actual)
        #full_message = build_message("Element:\n @element.tag_name = #{@element.tag_name}\n @element.text = #{@element.text}\n @element.html = #{@element.html.slice(0, 120)} ...\n " + message.to_s, "<?> should be true!", actual)
        full_message = build_message(message.to_s, "<?> should be true!", actual)
      end
      #assert_block(build_message(message, "<?> should be true!", actual)) do
      assert_block(full_message) do
        actual == true
      end
      time = Time.new

      #puts "#{time.strftime('%Y.%m.%d %H:%M:%S')} - assert_true: #{@message} ---> " + (passed? ? "PASS" : "FAIL") + "\n"

      if passed?
        #puts ("#{time.strftime('%Y.%m.%d %H:%M:%S')} - assert_true: #{@message} ---> " + "PASS").green
        puts "#{time.strftime('%Y.%m.%d %H:%M:%S')} - assert_true: #{@message.green} ---> " + "PASS".green
      else
        #puts ("#{time.strftime('%Y.%m.%d %H:%M:%S')} - assert_true: #{@message} ---> " + "FAIL").red
        puts "#{time.strftime('%Y.%m.%d %H:%M:%S')} - assert_true: #{@message.red} ---> " + "FAIL".red
      end

      write_result_to_file
    end
  end

  def assert_false(actual, message = nil)
    _wrap_assertion do
      if @element == nil
        full_message = build_message(message, "<?> should be false!", actual)
      else
        #full_message = build_message("Element:\n @element.tag_name = #{@element.tag_name}\n @element.text = #{@element.text}\n @element.html = #{@element.html}\n " + message.to_s, "<?> should be false!", actual)
        #full_message = build_message("Element:\n @element.tag_name = #{@element.tag_name}\n @element.text = #{@element.text}\n @element.html = #{@element.html.slice(0, 120)} ...\n " + message.to_s, "<?> should be true!", actual)
        full_message = build_message(message.to_s, "<?> should be false!", actual)
      end
      #assert_block(build_message(message, "<?> should be false!", actual)) do
      assert_block(full_message) do
        actual == false
      end
      time = Time.new
      #puts "#{time.strftime('%Y.%m.%d %H:%M:%S')} - assert_false: #{@message} ---> " + (passed? ? "PASS" : "FAIL") + "\n"

      if passed?
        #puts ("#{time.strftime('%Y.%m.%d %H:%M:%S')} - assert_false: #{@message} ---> " + "PASS").green
        puts "#{time.strftime('%Y.%m.%d %H:%M:%S')} - assert_false: #{@message.green} ---> " + "PASS".green
      else
        #puts ("#{time.strftime('%Y.%m.%d %H:%M:%S')} - assert_false: #{@message} ---> " + "FAIL").red
        puts "#{time.strftime('%Y.%m.%d %H:%M:%S')} - assert_false: #{@message.red} ---> " + "FAIL".red
      end

      write_result_to_file
    end
  end

  def getCurrentQuarter
    quarter = case Time.new.month
      when  1 .. 3 then 1
      when  4 .. 6 then 2
      when  7 .. 9 then 3
      when 10 ..12 then 4
    end
  end

  def getCurrentHalfYear
    if Time.new.month < 7 then
      halfyear = 1
    else
      halfyear = 2
    end
  end



  # Methods used for RAutomation
  def load_window(waittime, window)
    begin
      Timeout::timeout(waittime) do
        time = Time.new
        yield
      end
    rescue Exception => e
      time = Time.new
      if window.exists?
        puts "#{time.strftime('%Y.%m.%d %H:%M:%S')} - Exception occurred:\n window.title = #{window.title}\n #{e}\n"
      else
        puts "#{time.strftime('%Y.%m.%d %H:%M:%S')} - Exception occurred:\n #{e}\n"
      end
      retries ||= 0
      puts "#{time.strftime('%Y.%m.%d %H:%M:%S')} - Exception: retries = #{retries}\n"
      if retries < @max_retries
        retries += 1
        time_to_wait = (Float(waittime) / @max_retries).round
        puts "#{time.strftime('%Y.%m.%d %H:%M:%S')} - Exception: time_to_wait = #{time_to_wait}\n"
        sleep time_to_wait
        retry
      else
        puts "#{time.strftime('%Y.%m.%d %H:%M:%S')} - Exception: raise Exception\n"
        raise e
      end
    end
  end

  def load_window_assert(waittime, window)
    load_window(waittime, window){
      assert_window_true window
      sleep 1
    }
  end

  def assert_window_true(window)
    _wrap_assertion do
      if window.exists?
        #full_message = build_message("Window:\n window.title = #{window.title}\n " + @message, "<?> should be true!", window.exists?)
        full_message = build_message("Window:\n window.hwnd = #{window.hwnd}\n " + @message, "<?> should be true!", window.exists?)
      else
        full_message = build_message(@message, "<?> should be true!", window.exists?)
      end
      assert_block(full_message) do
        window.exists? == true
      end
      time = Time.new
      #puts "#{time.strftime('%Y.%m.%d %H:%M:%S')} - assert_window_true: #{@message} ---> " + (passed? ? "PASS" : "FAIL") + "\n"

      if passed?
        #puts ("#{time.strftime('%Y.%m.%d %H:%M:%S')} - assert_window_true: #{@message} ---> " + "PASS").green
        puts "#{time.strftime('%Y.%m.%d %H:%M:%S')} - assert_window_true: #{@message.green} ---> " + "PASS".green
      else
        #puts ("#{time.strftime('%Y.%m.%d %H:%M:%S')} - assert_window_true: #{@message} ---> " + "FAIL").red
        puts "#{time.strftime('%Y.%m.%d %H:%M:%S')} - assert_window_true: #{@message.red} ---> " + "FAIL".red
      end

      write_result_to_file
    end
  end

end
