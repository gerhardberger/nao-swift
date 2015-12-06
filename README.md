# nao-swift ⚡️

A *Swift* library to control the [**Nao**](https://www.aldebaran.com/en/humanoid-robot/nao-robot) robot through **HTTP requests**.

## Example

``` swift
let nao = Nao(ipAdress: "192.168.1.12", port: 54010)

nao.goTo(posture: .Stand, speed: 0.5) { success, result in
    if success {
        print(res!)
    }
    else {
      print("Something went wrong! 😓")
    }
}
```

## API
### Create
##### `nao = Nao(ipAdress: String, port: Int)`
Creates a `Nao` object, `ipAdress` is the IP adress of Nao, and `port` is the number of the port it's listening for commands.

### Posture
##### `nao.goTo(posture: Posture, speed: Float, callback: (Bool, String?) -> ())`
Goes Nao to one of the [predefined](http://doc.aldebaran.com/1-14/naoqi/motion/alrobotposture.html#term-predefined-postures) `posture`s with the given `speed`. The `cb` callback's parameter is a *success* `Bool` and a *result* `String?`. [Original command](http://doc.aldebaran.com/1-14/naoqi/motion/alrobotposture-api.html#ALRobotPosture::goToPosture__ssC.floatC).

##### `nao.apply(posture: Posture, speed: Float, callback: (Bool, String?) -> ())`
Applies a predefined `posture` with the given `speed`. [Original command](http://doc.aldebaran.com/1-14/naoqi/motion/alrobotposture-api.html#ALRobotPosture::applyPosture__ssCR.floatCR).

##### `nao.stop()`
Stops Nao. [Original command](http://doc.aldebaran.com/1-14/naoqi/motion/alrobotposture-api.html#ALRobotPosture::stopMove).

##### `nao.maxTry: Int`
Sets the maximum number of tries performed by `nao.goTo()` before returning a fail. [Original command](http://doc.aldebaran.com/1-14/naoqi/motion/alrobotposture-api.html#ALRobotPosture::setMaxTryNumber__iCR).


### Navigation
##### `nao.moveTo(x: Float, y: Float, theta: Float, callback: (Bool, String?) -> ())`
Makes Nao move to the given position `x`, `y` with the rotation `theta` (*in radians*) in the ground plane, relative to `FRAME_ROBOT`. [Original command](http://doc.aldebaran.com/1-14/naoqi/motion/alnavigation-api.html#ALNavigationProxy::moveTo__floatCR.floatCR.floatCR).

##### `nao.securityDistance: Float`
Defines the security area in which any object detection stops the robot. Default: 0.4m. [Original command](http://doc.aldebaran.com/1-14/naoqi/motion/alnavigation-api.html#ALNavigationProxy::setSecurityDistance__floatCR).

### Text to speech
##### `nao.say(s: String, callback: (Bool, String?) -> ())`
Says the specified `s` string of characters. [Original command](http://doc.aldebaran.com/1-14/naoqi/audio/altexttospeech-api.html#ALTextToSpeechProxy::say__ssCR).

##### `nao.language: String`
Sets the language currently used by the text to speech system. Default: English. [Original command](http://doc.aldebaran.com/1-14/naoqi/audio/altexttospeech-api.html#ALTextToSpeechProxy::setLanguage__ssCR).
