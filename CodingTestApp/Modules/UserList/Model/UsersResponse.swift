
import Foundation

struct UsersResponse : Codable {
	let id : Int?
	let name : String?
	let username : String?
	let email : String?
	let address : Address?
	let phone : String?
	let website : String?
	let company : Company?
}
