import Quick
import Nimble
@testable import simple_mvvmc_rx_api

class JokeModelSpec: QuickSpec {
    override class func spec() {
        describe("Joke") {
            let joke = Joke(id: 1, type: "type1", setup: "setup1", punchline: "punchline1")
            
            context("when comparing two jokes") {
                it("should not be equal if different ID") {
                    let differentID = Joke(id: 3, type: "type3", setup: "setup3", punchline: "punchline3")
                    expect(joke).toNot(equal(differentID))
                }
                
                it("should not be equal") {
                    let differentSetup = Joke(id: 1, type: "type1", setup: "Different setup1", punchline: "punchline3")
                    expect(joke).toNot(equal(differentSetup))
                }
            }
        }
    }
}
