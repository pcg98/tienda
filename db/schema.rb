# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_06_14_115607) do
  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "cards", force: :cascade do |t|
    t.string "iban"
    t.integer "cvv"
    t.integer "mes_caducidad"
    t.integer "year_caducidad"
    t.string "titular"
    t.integer "usuario_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["usuario_id"], name: "index_cards_on_usuario_id"
  end

  create_table "carritos", force: :cascade do |t|
    t.datetime "fecha_creaccion"
    t.float "precio_total"
    t.boolean "finalizado"
    t.integer "usuario_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["usuario_id"], name: "index_carritos_on_usuario_id"
  end

  create_table "linea_facturas", force: :cascade do |t|
    t.float "precio_unitario"
    t.integer "unidades"
    t.float "precio_linea"
    t.integer "producto_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "carrito_id", null: false
    t.integer "size_id", null: false
    t.index ["carrito_id"], name: "index_linea_facturas_on_carrito_id"
    t.index ["producto_id"], name: "index_linea_facturas_on_producto_id"
    t.index ["size_id"], name: "index_linea_facturas_on_size_id"
  end

  create_table "pedidos", force: :cascade do |t|
    t.datetime "fecha_creaccion"
    t.date "fecha_entrega"
    t.string "status"
    t.integer "carrito_id"
    t.integer "usuario_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["carrito_id"], name: "index_pedidos_on_carrito_id"
    t.index ["usuario_id"], name: "index_pedidos_on_usuario_id"
  end

  create_table "productos", force: :cascade do |t|
    t.string "nombre"
    t.float "precio"
    t.string "categoria"
    t.string "sexo"
    t.string "marca"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rols", force: :cascade do |t|
    t.string "rol"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sizes", force: :cascade do |t|
    t.string "talla"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "stock"
    t.integer "producto_id", null: false
    t.index ["producto_id"], name: "index_sizes_on_producto_id"
  end

  create_table "usuarios", force: :cascade do |t|
    t.string "telefono"
    t.string "nombre"
    t.string "apellidos"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.integer "rol_id", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_usuarios_on_email", unique: true
    t.index ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true
    t.index ["rol_id"], name: "index_usuarios_on_rol_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "cards", "usuarios"
  add_foreign_key "carritos", "usuarios"
  add_foreign_key "linea_facturas", "carritos"
  add_foreign_key "linea_facturas", "productos"
  add_foreign_key "linea_facturas", "sizes"
  add_foreign_key "pedidos", "carritos"
  add_foreign_key "pedidos", "usuarios"
  add_foreign_key "sizes", "productos"
  add_foreign_key "usuarios", "rols"
end
