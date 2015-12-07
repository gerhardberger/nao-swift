# Make sure to paste these improts and the `NaoRequestHandler` class in your
# Python script box's code!
import urlparse
from BaseHTTPServer import BaseHTTPRequestHandler,HTTPServer

class NaoRequestHandler(BaseHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200)
        self.send_header('Content-type','text/html')
        self.end_headers()

        IPADDRESS = '127.0.0.1'
        PORT = 64714

        parsed = urlparse.urlparse(self.path)
        cmd = urlparse.parse_qs(parsed.query)
        print(cmd)

        if 'goTo' in cmd:
            try:
                postureProxy = ALProxy('ALRobotPosture', IPADDRESS, PORT)
            except Exception, e:
                self.wfile.write("error")
                print "Could not create proxy to ALRobotPosture"
                print "Error was: ", e
                return
            s = float(cmd['speed'][0])
            postureProxy.goToPosture(cmd['goTo'][0], s)

        if 'apply' in cmd:
            try:
                postureProxy = ALProxy('ALRobotPosture', IPADDRESS, PORT)
            except Exception, e:
                self.wfile.write("error")
                print "Could not create proxy to ALRobotPosture"
                print "Error was: ", e
                return
            s = float(cmd['speed'][0])
            postureProxy.applyPosture(cmd['apply'][0], s)

        if 'stop' in cmd:
            try:
                postureProxy = ALProxy('ALRobotPosture', IPADDRESS, PORT)
            except Exception, e:
                self.wfile.write("error")
                print "Could not create proxy to ALRobotPosture"
                print "Error was: ", e
                return
            postureProxy.stopMove()

        if 'moveTo' in cmd:
            try:
                navProxy = ALProxy('ALNavigation', IPADDRESS, PORT)
            except Exception, e:
                self.wfile.write("error")
                print "Could not create proxy to ALNavigation"
                print "Error was: ", e
                return
            x = float(cmd['x'][0])
            y = float(cmd['y'][0])
            t = float(cmd['t'][0])
            navProxy.moveTo(x, y, t)

        if 'say' in cmd:
            try:
                ttsProxy = ALProxy('ALTextToSpeech', IPADDRESS, PORT)
            except Exception, e:
                self.wfile.write("error")
                print "Could not create proxy to ALTextToSpeech"
                print "Error was: ", e
                return
            ttsProxy.say(cmd['say'][0])

        self.wfile.write("success")


# This is the class that Choregraphe provides you!
class MyClass(GeneratedClass):
    def __init__(self):
        GeneratedClass.__init__(self)

        # Paste this two lines of code, with the IP address and PORT number
        # that you will connect on iOS.
        server = HTTPServer(('localhost', 3001), NaoRequestHandler)
        server.serve_forever()


    def onLoad(self):
        #put initialization code here
        pass

    def onUnload(self):
        #put clean-up code here
        #server.socket.close()
        pass

    def onInput_onStart(self):
        #self.onStopped() #activate the output of the box
        pass

    def onInput_onStop(self):
        self.onUnload()
        self.onStopped()
