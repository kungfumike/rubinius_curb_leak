A project to investigate a Rubinius/Curb memory leak

I have a streaming consumer in one of projects that was growing unbounded under the Brightbox build of ruby 1.9.3-p327. I attempted to change out Brightbox for Rubinis 2.0.0.rc1 (1.9.3 cc3b3d71 yyyy-mm-dd JI), but again noticed the same memory leak. I finally switched to MRI 1.9.3-p327 which cause the leak to cease. It left me wholly unsatisfied though, as I would prefer not to just change out Ruby interpreters until 'one works'.

I have a preference for Rubinius and, as such, started this little investigation using: rubinius 2.0.0.rc1 (1.9.3 cc3b3d71 yyyy-mm-dd JI) [x86_64-unknown-linux-gnu] . 

The run script will start the puma server and 2 ruby processes to connect to it for streaming. It becomes evident, quite quickly, that the curb based stream grows unbounded while the Net:Http based streamer does not.
