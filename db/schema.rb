# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20161018184855) do

  create_table "categories", force: :cascade do |t|
    t.string   "nombre"
    t.string   "descripcion"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
  end

  create_table "clients", force: :cascade do |t|
    t.integer  "documento"
    t.string   "tipo_documento"
    t.string   "nombre"
    t.string   "apellido"
    t.integer  "telefono"
    t.string   "direccion"
    t.string   "pais"
    t.string   "ciudad"
    t.string   "email"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "membership_id"
    t.integer  "user_id"
  end

  add_index "clients", ["membership_id"], name: "index_clients_on_membership_id"

  create_table "discounts", force: :cascade do |t|
    t.integer  "society_id"
    t.integer  "category_id"
    t.integer  "discount_porcentaje"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "user_id"
  end

  add_index "discounts", ["category_id"], name: "index_discounts_on_category_id"
  add_index "discounts", ["society_id"], name: "index_discounts_on_society_id"

  create_table "forma_de_pagos", force: :cascade do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "memberships", force: :cascade do |t|
    t.integer  "society_id"
    t.string   "periodicidad"
    t.date     "fecha_afiliacion"
    t.date     "fecha_vencimiento"
    t.date     "fecha_cuota"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.boolean  "estado"
    t.integer  "user_id"
    t.float    "pago_acomulado"
  end

  add_index "memberships", ["society_id"], name: "index_memberships_on_society_id"

  create_table "outflows", force: :cascade do |t|
    t.date     "feha"
    t.string   "concepto"
    t.integer  "nit"
    t.string   "entidad"
    t.integer  "numero_factura"
    t.decimal  "valor"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "receipts", force: :cascade do |t|
    t.date     "fecha"
    t.float    "valor_total"
    t.integer  "client_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "soporte_file_name"
    t.string   "soporte_content_type"
    t.integer  "soporte_file_size"
    t.datetime "soporte_updated_at"
    t.integer  "forma_de_pago_id"
    t.integer  "user_id"
    t.integer  "membership_id"
  end

  add_index "receipts", ["client_id"], name: "index_receipts_on_client_id"
  add_index "receipts", ["forma_de_pago_id"], name: "index_receipts_on_forma_de_pago_id"
  add_index "receipts", ["membership_id"], name: "index_receipts_on_membership_id"

  create_table "societies", force: :cascade do |t|
    t.string   "nombre"
    t.string   "descripcion"
    t.float    "val_anual"
    t.float    "val_semestral"
    t.float    "val_mensual"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "email"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.boolean  "admin",           default: false
    t.string   "password_digest"
  end

end
