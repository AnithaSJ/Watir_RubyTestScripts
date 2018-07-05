puts "Test:FehlerEmail *\n"

puts "#{Time.new.strftime('%Y.%m.%d %H:%M:%S')} - START TESTING . . .\n"

require "./test_base_fw"
require 'test/unit/assertions'

class TestExample

  #To compare two strings
  def compare(s1, s2)
    if (s1==s2)
       puts '-------> PASS'.green
    else
      puts '------->FAIL'.red
    end
  end

  #Check for message
  def wait_message
    puts "'KuZu-Reporting >> Cockpit: KuZu-Reporting 2.0 >> Bitte wählen Sie ein Autohaus. ' exists?".yellow
    s1 = @@b.element(:xpath, "//div[@id='csmContentDetail']/div").text
    s2 = "Bitte wählen Sie ein Autohaus."
    compare(s1,s2)
  end

  def test_KuZu_Reporting_submodule_Fehlerhafte_Emailadressen
    browse_to_new_project

    login_to_portal

    @message = "'KuZu-Reporting' exists?"
    load_link_assert(@timeout_error_length, "link", "text", "KuZu-Reporting")

    @load_link_message = "'KuZu-Reporting' ---> click"
    load_link_wait_until_exist(@timeout_error_length, "link", "text", "KuZu-Reporting", "link", "xpath", "(//a[contains(text(),'Fehlerhafte E-Mailadressen')])")
    @@b.element(:xpath, "//ul[@id='nav']/li[1]/a[contains(text(),'KuZu-Reporting')]").hover

    @message = "'KuZu-Reporting >> Cockpit' exists?"
    load_link_assert(@timeout_error_length, "link", "xpath", "(//a[contains(text(),'Fehlerhafte E-Mailadressen')])")

    @load_link_message = "'KuZu-Reporting' ---> click"
    @@b.element(:xpath, "//ul[@id='nav']/li[1]/ul[1]/li[1]/ul[3]/li[6]/a[contains(text(),'Fehlerhafte E-Mailadressen')]").click

    @@b.wait_until{@@b.div(:id, "naviTreeReports").exists?}

    @message = "'KuZu-Reporting >> Cockpit: KuZu-Reporting 2.0 >> Übersicht: div:  naviTreeReports' exists?"
    load_link_assert(@timeout_error_length, "div", "id", "naviTreeReports")
    @@b.wait_until{@@b.div(:id, "csmContentDetail").exists?}
    wait_message

    @@b.wait_until{@@b.li(:id, "org_loc_29").exists?}

    @message = "'KuZu-Reporting >> Cockpit: KuZu-Reporting 2.0 >> Zusätzliche Vorführfahrzeuge >> VW Deutschland' exists?"
    load_link_assert(@timeout_error_length, "li", "id", "org_loc_29")
    @@b.wait_until{@@b.div(:id, "csmContentDetail").exists?}
    wait_message

    @load_link_message = "'VW Deutschland' ---> click"
    @@b.element(:xpath,"//li[@id='org_loc_29']/ins[contains(@class, 'jstree-icon')]").click!
#.click! why? Element not clickable error refer "https://stackoverflow.com/questions/46588791/element-is-not-clickable-error-ruby-watir"

    @message = "'KuZu-Reporting >> Cockpit: KuZu-Reporting 2.0 >> Zusätzliche Vorführfahrzeuge >> Region Nord ' exists?"
    load_link_assert(@timeout_error_length, "li", "id", "org_loc_779558")

    @load_link_message = "'Region Nord' ---> click"
    @@b.element(:xpath,"//li[@id='org_loc_779558']/ins[contains(@class, 'jstree-icon')]").click
    @@b.wait_until{@@b.div(:id, "csmContentDetail").exists?}
    wait_message

    @message = "'KuZu-Reporting >> Cockpit: KuZu-Reporting 2.0 >> Zusätzliche Vorführfahrzeuge >> 101 ' exists?"
    load_link_assert(@timeout_error_length, "li", "id", "org_loc_779608")

    @load_link_message = "'101' ---> click"
    @@b.element(:xpath,"//li[@id='org_loc_779608']/ins[contains(@class, 'jstree-icon')]").click

    @@b.wait_until{@@b.div(:id, "csmContentDetail").exists?}
    wait_message

    @message = "'KuZu-Reporting >> Cockpit: KuZu-Reporting 2.0 >> Zusätzliche Vorführfahrzeuge >> Autozentrum Nord Flensburg (32492) ' exists?"
    load_link_assert(@timeout_error_length, "li", "id", "org_loc_778924")

    @load_link_message = "'Autozentrum Nord Flensburg (32492)' ---> click"
    @@b.element(:xpath,"//li[@id='org_loc_778924']/a[contains(text(), 'Autozentrum Nord Flensburg (32492)')]").click
    #Check for 'Bitte wählen Sie ein Autohaus.'
    if not @@b.div(:id, "csmContentDetail").exists?
      puts "cemdBouncedEmailDataListTable is not displayed".red
    end

    #PDF visiblity_check
    # TODO: Pdf Download check popup windows
    @message = "'KuZu-Reporting >> Cockpit: KuZu-Reporting 2.0 >> Zusätzliche Vorführfahrzeuge >> PDF ' exists?"
    load_link_assert(@timeout_error_length, "button", "id", "csxBouncedEmailPdfbtn")

  #  @load_link_message = "'PDF Download' ---> click"
  #  @@b.element(:xpath,"//button[@id='csxBouncedEmailPdfbtn']").click!

    puts "'KuZu-Reporting >> Cockpit: KuZu-Reporting 2.0 >> Zusätzliche Vorführfahrzeuge >>Einheit' exists?".yellow
    s1 = @@b.element(:xpath, "//div[@id='subpage-header']/div/div[2]/table[1]/tbody/tr/td[2]").text
    #assert_equal(s, "Autozentrum Nord[...] (32492)", failure_message= "---> Fail")
    s2 = "Autozentrum Nord[...] (32492)"
    compare(s1,s2)

    puts"'KuZu-Reporting >> Cockpit: KuZu-Reporting 2.0 >> Zusätzliche Vorführfahrzeuge >>Datum' exists?".yellow
    s1 = @@b.element(:xpath, "//div[@id='subpage-header']/div/div[2]/table[2]/tbody/tr/td[2]").text
    time = Time.now.to_s
    time = DateTime.parse(time).strftime("%d.%m.%Y")
    compare(s1, time)
    puts 'Current System time:'.yellow + time.yellow
    #assert_equal(s, time, failure_message = "---> Fail")

    @load_link_message = "'KuZu-Reporting >> Cockpit: KuZu-Reporting 2.0 >> Zusätzliche Vorführfahrzeuge >>Fehlerhafte E-Mailadressen tool tip i' exists?"
    load_link_assert(@timeout_error_length, "div", "id", "panel-with-excel-export")

    #Check table exist or not
    @message = "'KuZu-Reporting >> Cockpit: KuZu-Reporting 2.0 >> Zusätzliche Vorführfahrzeuge >>cemdBounced Email DataListTable' exists?"
    load_link_assert(@timeout_error_length, "table", "id", "cemdBouncedEmailDataListTable")
    if not @@b.div(:id, "checkAllEmail").exists?
      puts "checkAllEmail checknox missing".red
    end

    if not @@b.div(:id, "saveCancelBtns").exists?
      puts "Save and Cancel button not displayed".red
    end

    if not @@b.div(:id, "footer").exists?
      puts "Footer is missing".red
    end

    #To check Cemd Table

    table_row_values = @@b.table(:id, "cemdBouncedEmailDataListTable").strings
    rows_total =  table_row_values.length  #8 total number of rows including header row
    String bestellnummer = Array[]
    String bestellnummer_sort = Array[]
    String fehlerEmailadressen = Array[]
    String fehlerEmailadressen_sort = Array[]
    String row_data = Array[]

    puts "KuZu-Reporting >> Cockpit: KuZu-Reporting 2.0 >> Zusätzliche Vorführfahrzeuge >>cemdBounced Email DataListTable".yellow

    #Display content of table
    # Total rows includes table header as a first row

    table_row_values.each do |x|
          # Loop over each cell in the row.
          x.each do |cell|
              row_data.push(cell)
              puts cell
          end
          # End of row.
          puts "----------------------------".yellow
    end

   #      Array [8][4]
   #       0 1 2 3       ----Header----
   #       4 5 6 7       ----Data------
   #       8 9 10 11
   #      12 13 14 15
   #       16 17 18 19
   #      20 21 22 23
   #      24 25 26 27
   #      28 29 30 31
    i=4 #Exclude header data
    while i < row_data.length.to_i
          bestellnummer.push(row_data[i])
          bestellnummer_sort.push(row_data[i])
          fehlerEmailadressen.push(row_data[i+2])
          fehlerEmailadressen_sort.push(row_data[i+2])
          i = i+4
    end

    #Table element sorting

    puts "KuZu-Reporting >> Cockpit: KuZu-Reporting 2.0 >> Zusätzliche Vorführfahrzeuge >>cemdBounced Email DataListTable--------> Sorting Check: Before".yellow
    puts " Auftrags- /bestellnummer ".green

    bestellnummer.each do |cell|
        puts cell
    end

    puts "  Fehlerhafte E-Mailadresse ".green

    fehlerEmailadressen.each do |cell|
        puts cell
    end

    puts "KuZu-Reporting >> Cockpit: KuZu-Reporting 2.0 >> Zusätzliche Vorführfahrzeuge >>cemdBounced Email DataListTable--------> Sorting Check: After".yellow

    puts " Excepted".yellow
    puts " Auftrags- /bestellnummer".green
    bestellnummer_sort = bestellnummer_sort.map(&:to_i).sort
    bestellnummer_sort.each do |cell|
        puts cell
    end

    puts " Fehlerhafte E-Mailadresse".green
    fehlerEmailadressen_sort = fehlerEmailadressen_sort.sort! #convert string to integer before soting
    fehlerEmailadressen_sort.each do |cell|
        puts cell
    end
    puts "----------------------------".yellow

    puts " Actual".yellow

    String bestellnummer_actual = Array[]
    String fehlerEmailadressen_actual = Array[]

    puts "'Sort <>' ---> click".yellow
    @@b.table(:id, "cemdBouncedEmailDataListTable").thead.tr.th(index: 1).click!
    i=4 #Exclude header data
    while i < row_data.length.to_i
          bestellnummer_actual.push(row_data[i])
          i = i+4
    end

    puts " Auftrags- /bestellnummer".green
    bestellnummer_actual.each do |cell|
        puts cell
    end


    puts "'Sort <>' ---> click".yellow
  #  @@b.element(:xpath,"//div[@id,'cemdBouncedEmailDataListTableDiv']/table(:id, "cemdBouncedEmailDataListTable")/thead/tr/th[3]").click!
    @@b.table(:id, "cemdBouncedEmailDataListTable").thead.tr.th(index: 3).click!
    i=4
    while i < row_data.length.to_i
          fehlerEmailadressen_actual.push(row_data[i+2])
          i = i+4
    end

    puts " Fehlerhafte E-Mailadresse".green
    fehlerEmailadressen_actual.each do |cell|
        puts cell
    end
    puts "----------------------------".yellow

    puts "KuZu-Reporting >> Cockpit: KuZu-Reporting 2.0 >> Zusätzliche Vorführfahrzeuge >>cemdBounced Email DataListTable--------> Is Sorted ?".yellow
    if bestellnummer == bestellnummer_actual && fehlerEmailadressen == fehlerEmailadressen_actual
      puts "------->PASS".green
    else
      puts "------->FAIL".red
    end

    puts"'KuZu-Reporting >> Cockpit: KuZu-Reporting 2.0 >> Zusätzliche Vorführfahrzeuge >>Alle auswählen' exists?".yellow

    if @@b.input(:id, "selectAllBouncedCheckboxes").disabled?
      puts "------->FAIL".red
    else
      puts "------->PASS".green
    end

    # TODO: Sorting of checkbox
    #Checkbox selct all is tested
    puts"'KuZu-Reporting >> Cockpit: KuZu-Reporting 2.0 >> Zusätzliche Vorführfahrzeuge >>Alle auswählen' ------>click?".yellow
    @@b.element(:xpath, "//input[contains(@id,'selectAllBouncedCheckboxes')]").click!
  #  @@b.checkbox(:id,"selectAllBouncedCheckboxes").set(true)

    checkbox_id = [102,103, 141,142,143,144,145]
    i=0
    checkbox_id.each do |y|
      if @@b.input(:id, y.to_s).checked?
          i = i + 1
      else
          i = i
      end
    end

    if i == rows_total- 1
     puts "All checkboxes are checked" + "------->PASS".green
    else
     puts "All checkboxes are not checked" +  i.to_s + "checkboxes are left unchecked" + "------->FAIL".red
    end



sleep(2)
logout_from_portal


end
end
