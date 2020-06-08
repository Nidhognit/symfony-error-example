# error example

###steps:
1. make .env file (can be created from .env.dist)
2. run command 
   ```bash
   make dc-release-dev
   ```
   all compiled and work fine

3. change .env enviroment to prod
4. run command
   ```bash
   make dc-release
   ```
   all compiled and work fine

5. go to the next files and uncomment rows that will enable preloading:

   5.1. oam/php/dev/config.ini:10-11
   
   5.2. oam/php/prod/config.ini:11-12

6. run command 
   ```bash
   make dc-release-dev
   ```
    all compiled and work fine
    
7. run command
  ```bash
  make dc-release
  ```
  you see error