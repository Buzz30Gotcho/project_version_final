const mongoose = require('mongoose');
const { policySchema } = require('./Policy');
var ObjectId = require('mongodb').ObjectID;

const userSchema = new mongoose.Schema(
	{
		password: {
			type: String,
			required: [true, 'Please provide a password'],
			minlength: 8,
			validate(value) {
				if (!value.match(/\d/) || !value.match(/[a-zA-Z]/)) {
					throw new Error('Password must contain at least one letter and one number');
				}
			},
		},
		username: {
			type: String,
			unique: true,
		},
		role: {
			type: String,
			enum: ['user', 'admin', 'seller'],
			default: 'user',
		},
		isAdmin: { type: Boolean, default: false },
		companyName: {
			type: String,
		},
		phone: {
			type: String,
			default : null
		},

		verificationCode: {
			type: String,
		},
		isVerified: {
			type: Boolean,
			default: false,
		},
		welcome: {
			type: Boolean,
			default: false,
		},
		profileImage: {
			type: String,
		},
		discountCode: {
			type: String,
		},
		email: {
			type: String,
			default : null
		},
		favouritsProductst: [
			{
				productId: { type: String },
			},
		],
		adresse: {
			latitude: { type: Number },
			longitude: { type: Number },
			countryCode: { type: String },
			country: { type: String },
			city: { type: String },
			postalCode: { type: String },
			locality: { type: String },
			apartmentNumber: { type: String },
			streetName: { type: String },
			region: { type: String },
			fullAddress: { type: String },
		},
		policy: policySchema ,
		shippingAdress: {
			countryCode: { type: String },
			country: { type: String },
			city: { type: String },
			postalCode: { type: String },
			locality: { type: String },
			apartmentNumber: { type: String },
			streetName: { type: String },
			region: { type: String },
			fullAddress: { type: String },
		},
		proximityRange: {
			type: Number,
			default: 20,
		},
	},

	{ timestamps: true }
);

userSchema.index({ username: 1 }, { unique: true });
module.exports = mongoose.model('User', userSchema);
