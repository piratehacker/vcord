module vcord

pub struct User {
pub:
	id				string
	username		string
	discriminator	string
	avatar			string = ""
	bot				bool = false
	system			bool = false
	mfa_enabled		bool = false
	locale			string = ""
	verified		bool = false
	email			string = ""
	flags			int = 0
	premium_type	int = 0
	public_flags	int = 0
}

pub fn (u &User) mention() string {
	return '<@$u.id>'
}

pub fn (u &User) tag() string {
	return '$u.username#$u.discriminator'
}

struct GuildMember {
mut:
	c 				&Client [skip]
pub:
	nick			string
	roles			[]string
	joined_at		string
	premium_since	string
	deaf			bool
	mute			bool
pub mut:
	guild_id		string
	user 			User
}

fn (m &GuildMember) inject(c &Client) {
	m.c = c
}