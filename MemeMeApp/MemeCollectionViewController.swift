//
//  MemeCollectionViewController.swift
//  MemeMeApp
//
//  Created by Shirley Hang on 5/24/15.
//  Copyright (c) 2015 att. All rights reserved.
//

import UIKit


class MemeCollectionViewController: UICollectionViewController, UICollectionViewDataSource {

    var memes: [Meme]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBarController?.tabBar.hidden = false
    
        //button to add more memes
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(
            
            title: "+",
            
            style: UIBarButtonItemStyle.Plain,
            
            target: self,
            
            action: "sendMoreMemes")
    }
    override func viewWillAppear(animated: Bool)
    {
        
        super.viewWillAppear(animated)
        
        let object = UIApplication.sharedApplication().delegate
        
        let appDelegate = object as! AppDelegate
        
        memes = appDelegate.memes
        
        self.collectionView?.reloadData()
        
        //check if there are memes sent, go to the editor screen if there are none
        if self.memes.count == 0
            
        {
            
            let editorViewController = self.storyboard?.instantiateViewControllerWithIdentifier("MemeEditorViewController")
                
                as! MemeEditorViewController
            
            presentViewController(editorViewController, animated: true, completion: nil)
            
        }
        
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return self.memes!.count
    }
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        //#warning Incomplete method implementation -- Return the number of sections
        return 1
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("MemeCollectionCell", forIndexPath: indexPath) as! MemeCollectionCell
        
        let meme = self.memes[indexPath.row]
        
        cell.memeImage?.image = meme.memedImage
    
        return cell
    }
    //send more memes
    func sendMoreMemes()
    {
        
        var memeEditor = storyboard?.instantiateViewControllerWithIdentifier("MemeEditorViewController")as! MemeEditorViewController
        
        //let navController = UINavigationController(rootViewController: memeEditor)
        
        self.presentViewController(memeEditor, animated: true, completion: nil)
        
    }
    //go to the detail screen for the selected meme
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath:NSIndexPath)
    {
        
        let object:AnyObject = self.storyboard!.instantiateViewControllerWithIdentifier("memeDetailViewController")!
        
        
        let detailViewController = object as! memeDetailViewController
        
        //populate view controller with data from the selected item

        
        detailViewController.memeDetail = self.memes[indexPath.row]
        
        
        self.navigationController!.pushViewController(detailViewController, animated: true)
        
        
    }
}
