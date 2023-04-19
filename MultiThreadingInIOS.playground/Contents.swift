import UIKit


//Multithreading - doing multiple async tasks

//1. Grand Central Dispatch (GCD) is a low-level API provided by Apple in IOS for performing tasks asynchronously and concurrently
//2. Operating and Operation Queues
//3. SwiftConcurrancy - IOS 13.0 Await-Async
//4. NSThread/Thread
//5. DispatchQueues
//6. PerformSelector
//7. Libraries - Combine
///Third party - PromiseKit, RXSwift, AsyncDisplayKit

//1.1. GCD - First In First Out (FIFO)
/// Tasks are added in to Queue and then GCD picks the oldest task and execute it first


//2. Operating and Operation Queues - built on top of GCD
let operation1 = BlockOperation{
    print("Block Operation 1")
}

let operation2 = BlockOperation{
    print("Block Operation 2")
}

let operation3 = BlockOperation{
    print("Block Operation 3")
}


let operationQueue = OperationQueue()
operationQueue.addOperation(operation1)
operationQueue.addOperation(operation2)
operationQueue.addOperation(operation3)

///1 depends on 2 so 2 executed first'
operation1.addDependency(operation2)
operation2.addDependency(operation3)

//print("Operation2 will be printed before operation1")
//print("Operation3 will be printed before operation2")

///true is serial and false is concurrent
operationQueue.addOperations([operation2,operation1,operation3], waitUntilFinished: true)










//3 types of Queues
///1. Main Queue - anything related to UI
///2. Serial Queues or Custom Queues
///3. Global Queues


//1. Main Queue
DispatchQueue.main.async {
    //self.tableview.reloadData()  - example
    print("Example of main thread")
}


//2. Serial Queues or Custom Queues
/// tasks executed in order
let customqueue = DispatchQueue(label: "com.multithreading.customqueue")
customqueue.async {
    print("Example of Serial Queues or Custom Queues")
    //viewModel.getDataFromAPI - example
}

///asynced serial queues
let customAsyncQueue = DispatchQueue(label: "app.com.customAsyncQueue")
customAsyncQueue.async {
    print("this will print 1st")
    print("this will print 2nd")
}

customAsyncQueue.async {
    print("this will print 3rd")
    print("this will print 4th")
}

///synced serial queues
customAsyncQueue.sync {
    print("this will print 1st")
    print("this will print 2nd")
}

customAsyncQueue.sync {
    print("this will print 3rd")
    print("this will print 4th")
}



//3. Global Queue -always concurrent
///3.1. UserInteractive
DispatchQueue.global(qos: .userInteractive).async {
    print("For any animations and user related jobs which involves updating UI")
}

///3.2. UserInitiated
DispatchQueue.global(qos: .userInitiated).async {
    print("when the user requires immediate data like scolling table view/pagination")
}

///3.3. Default
DispatchQueue.global().async {
    print("falls inbetween Userinitiated and utility in terms of priority [default]")
}

///3.4. Utility
///tasks that are not high priority and user is aware
DispatchQueue.global(qos: .utility).async {
    print("when it is a long running task such as downloading files, heavy data")
}


///3.5. Background
DispatchQueue.global(qos: .background).async {
    print("users are not aware, example whatsapp creates backups, restoring databases, data sync task")
}


///3.6. Unspecified
DispatchQueue.global(qos: .unspecified).async {
    print("least priority tasks")
}








//4. Dispatch Queue with Delay
DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
    print("Example of Dispatch Queue with Delay")
}




//sequences all start at the same time (parellel), so the order is random when finised.
///concurrent asynced queues are not ordered
let concurrentQueue = DispatchQueue(label: "app.com.concurrentQueue", attributes: .concurrent)
concurrentQueue.async {
    print("this might print 1st")
    print("this might print 2nd")
}

concurrentQueue.async {
    print("this might print 3rd")
    print("this might print 4th")
    
}

///concurrent synced queues are ordered
concurrentQueue.sync {
    print("this will print 1st")
    print("this will print 2nd")
}


concurrentQueue.sync {
    print("this will print 3rd")
    print("this will print 4th")
    
}




//App Life Cycle
///1. Active - when user is interacting with app
///2. Inactive - When app is in use but user is not interacting with app
///3. Background - app is in the background but still doing a task such as playing music or downloading files
///4. Suspended - app is in the background and not in use, and will be killed if taking too much memory
///5. Not running - the app is not in use


