# Concave Collision

---

## Introduction

This is a demonstration of how to achieve a concave collision path in UIKit Dynamics.
Because UIKit Dynamics does not permit concave paths, you can just create a series of
individual line collision paths (which collectively achieve concave performance).

This app will launch into a blank screen. 

 1. You can stroke a path by dragging you finger.
 2. You can drop a ball by tapping your finger.
 
So, here, I drew a curved path and then tapped above it to drop a ball.

![image](https://i.stack.imgur.com/9nEjk.gif)

## References

See https://stackoverflow.com/a/71867916/1271826

Relevant code is in [`ViewController`](ConcaveCollision/ViewController.swift).

---

17 April 2022

Copyright © 2022 Robert M. Ryan. All Rights Reserved.

See [License](LICENSE.md).
